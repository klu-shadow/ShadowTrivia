class AddCurrentQuestionIdxToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :question_number, :integer, default: 0
  end
end
