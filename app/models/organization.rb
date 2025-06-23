class Organization < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :menus, dependent: :destroy

  validates :name, presence: true
end
