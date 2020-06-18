class Game < ApplicationRecord
  belongs_to :user 
  belongs_to :category

  validates :user_id, presence: true

  def self.build(user_id, category_id)
    game = Game.new(user_id: user_id, category_id: category_id)
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
      self.update_correct_answer
    else 
      self.update_incorrect_answer
    end
    self.update_max_streaks
    self.increment_question_number
    self.save
  end

  def update_correct_answer 
    self.current_incorrect_streak = 0
    self.current_streak += 1
    # 200 + 10 times streak bonus per correct to score
    self.score += 200 + (self.current_streak-1) * 10
  end

  def update_incorrect_answer
    self.current_incorrect_streak += 1
    self.current_streak = 0
    # 100 - 20 times incorrect streak per wrong answer to score
    self.score -= 100 - (self.current_incorrect_streak-1) * 20
  end

  def update_max_streaks
    self.max_streak = self.current_streak if self.max_streak < self.current_streak
    self.max_incorrect_streak = self.current_incorrect_streak if self.max_incorrect_streak < self.current_incorrect_streak
  end

  def increment_question_number
    if self.question_number < self.question_ids.length-1
      self.question_number += 1
    else 
      self.done = true
      self.submit_highscore
    end
  end

  def submit_highscore
    current_highscore = HighScore.find_by(user_id: self.user_id)
    if !current_highscore
      HighScore.create(
        user_id: self.user_id, 
        category_id: self.category_id, 
        game_id: self.id,
        score: self.score
        )
    end

    if current_highscore && current_highscore.score < self.score
      current_highscore.update(score: self.score)
    end
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
#  category_id              :integer(4)      not null
#  done                     :boolean         default("false")
#  score                    :integer(4)      default("0")
#

