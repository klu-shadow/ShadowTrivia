require 'rails_helper'

RSpec.describe Game, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

