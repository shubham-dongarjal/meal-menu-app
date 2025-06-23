class AddUniqueIndexToUserAndMenuInMenuResponses < ActiveRecord::Migration[7.1]
  def change
    add_index :menu_responses, [:user_id, :menu_id], unique: true
  end
end
