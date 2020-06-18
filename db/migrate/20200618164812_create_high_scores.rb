class CreateHighScores < ActiveRecord::Migration[5.2]
  def change
    create_table :high_scores do |t|
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.integer :score, null: false
      t.integer :game_id, null: false

      t.index :user_id, unique: true
      t.index :category_id
      t.index :game_id, unique: true
      t.index :score
      t.timestamps
    end
  end
end
