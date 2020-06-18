class AddCategoryIdAndDoneToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :category_id, :integer, null: false
    add_column :games, :done, :boolean, default: false

    add_index :games, :category_id
    add_index :games, :done
  end
end
