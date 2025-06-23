class Menu < ApplicationRecord
  belongs_to :organization
  has_many :menu_responses, dependent: :destroy

  validates :menu_date, presence: true
  validates :description, presence: true

  paginates_per 10

  def total_chapatis
    menu_responses.sum(:chapatis_count)
  end

  def snacks_yes_count
    menu_responses.where(snacks: true).count
  end

  def dinner_yes_count
    menu_responses.where(dinner: true).count
  end

  def response_open?
    created_at >= 2.hours.ago
  end
end
