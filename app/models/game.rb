class Game < ApplicationRecord
  validates :user_id, presence: true
  
  after_initialize :generate_questions_list

  def generate_questions_list(user_id, category_id, num=10)
    game = Game.new(user_id: user_id)
    questions = Category.find(category_id).questions
    # grabs random num questions from list and plucks ids
    game.question_ids = questions.sample(num).pluck(:id)
  end


end


# == Schema Information
#
# Table name: games
#
#  id                       :integer(8)      not null, primary key
#  user_id                  :integer(4)      not null
#  question_ids             :integer(4)      default("{}")
#  current_streak           :integer(4)      default("0")
#  max_streak               :integer(4)      default("0")
#  current_incorrect_streak :integer(4)      default("0")
#  max_incorrect_streak     :integer(4)      default("0")
#  user_answers             :string          default("{}")
#  created_at               :datetime        not null
#  updated_at               :datetime        not null
#

