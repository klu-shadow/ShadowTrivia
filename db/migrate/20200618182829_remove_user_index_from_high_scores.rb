class RemoveUserIndexFromHighScores < ActiveRecord::Migration[5.2]
  def change
    remove_index :high_scores, :user_id
    add_index :high_scores, :user_id
  end
end
