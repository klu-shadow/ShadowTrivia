require 'rails_helper'

RSpec.describe HighScore, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

