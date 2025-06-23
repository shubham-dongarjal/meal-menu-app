class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :organization
  has_many :menu_responses, dependent: :destroy

  validate :password_complexity

  after_initialize :set_default_role, if: :new_record?

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  enum role: {
    employee: 'employee',
    admin: 'admin'
  }

  def set_default_role
    self.role ||= :employee
  end

  def generate_login_token!
    self.login_token = SecureRandom.hex(10)
    self.login_token_sent_at = Time.current
    save!
  end

  def login_token_valid?
    login_token_sent_at && login_token_sent_at > 15.minutes.ago
  end

  def clear_login_token!
    update!(login_token: nil, login_token_sent_at: nil)
  end

  def password_complexity
    return if password.blank?
    
    unless password.match(/\A(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{6,128}\z/)
      errors.add :password, "must include at least one lowercase letter, one uppercase letter, one digit, and one special character"
    end
  end
end

# def self.from_omniauth(auth)
#   # Try to find by provider/uid first
#   user = where(provider: auth.provider, uid: auth.uid).first_or_initialize
  
#   if user.new_record?
#     # Try to find by email if user exists without OAuth
#     existing_user = find_by(email: auth.info.email)
#     if existing_user
#       # Link OAuth credentials to existing account
#       existing_user.update(provider: auth.provider, uid: auth.uid)
#       return existing_user
#     end

#     # Create new user with default organization
#     user.assign_attributes(
#       email: auth.info.email,
#       password: Devise.friendly_token[0, 20],
#       name: auth.info.name || auth.info.email.split('@').first,
#       organization: Organization.first || Organization.create(name: "Default Organization")
#     )
    
#     unless user.save
#       Rails.logger.error "Failed to create user: #{user.errors.full_messages}"
#     end
#   end
  
#   user
# end