class RemoveUserIndexFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_index :games, :user_id
    add_index :games, :user_id
  end
end
