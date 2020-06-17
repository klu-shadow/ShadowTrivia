class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :user_id, null: false
      t.integer :question_ids, array: true, default: []
      t.integer :current_streak, default: 0
      t.integer :max_streak, default: 0
      t.integer :current_incorrect_streak, default: 0
      t.integer :max_incorrect_streak, default: 0
      t.string :user_answers, array: true, default: []      
      
      t.index :question_ids
      t.index :user_id
      t.timestamps
    end
  end
end
