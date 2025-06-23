class CreateMenuResponses < ActiveRecord::Migration[7.1]
  def change
    create_table :menu_responses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true
      t.boolean :snacks
      t.boolean :dinner
      t.integer :chapatis_count
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
