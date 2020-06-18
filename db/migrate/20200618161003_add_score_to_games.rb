class AddScoreToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :score, :integer, default: 0

    add_index :games, :score
  end
end
