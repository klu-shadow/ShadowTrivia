class Game < ApplicationRecord
  validates :user_id, presence: true

  def self.build(user_id, category_id)
    game = Game.new(user_id: user_id)
    game.generate_questions_list(category_id)
    game
  end

  def generate_questions_list(category_id, num=10)
    questions = Category.find(category_id).questions
    # grabs random num questions from list and plucks ids
    self.question_ids = questions.sample(num).pluck(:id)
  end

  def check_answer
    correct_answer = Question.find(self.question_ids[self.question_number]).correct_answer
    if (correct_answer == self.user_answers.last)
      self.current_incorrect_streak = 0
      self.current_streak += 1
    else 
      self.current_incorrect_streak += 1
      self.current_streak = 0
    end
    self.update_max_streaks
    self.increment_question_number
    self.save
  end

  def update_max_streaks
    self.max_streak = self.current_streak if self.max_streak < self.current_streak
    self.max_incorrect_streak = self.current_incorrect_streak if self.max_incorrect_streak < self.current_incorrect_streak
  end

  def increment_question_number
    self.question_number += 1
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
#  question_number          :integer(4)      default("0")
#

