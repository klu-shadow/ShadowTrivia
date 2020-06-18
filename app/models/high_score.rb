class HighScore < ApplicationRecord
  validates :user_id, :category_id, :game_id, :score, presence: true

  belongs_to :user 
  belongs_to :category 
  belongs_to :game

end

# == Schema Information
#
# Table name: high_scores
#
#  id          :integer(8)      not null, primary key
#  user_id     :integer(4)      not null
#  category_id :integer(4)      not null
#  score       :integer(4)      not null
#  game_id     :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

