class MenuResponse < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates :user_id, uniqueness: { scope: :menu_id, message: 'has already responded to this menu' }
  validates :chapatis_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
