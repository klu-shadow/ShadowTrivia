class Tagging < ApplicationRecord
  validates :category_id, :question_id, presence: true

end

# == Schema Information
#
# Table name: taggings
#
#  id          :integer(8)      not null, primary key
#  category_id :integer(4)      not null
#  question_id :integer(4)      not null
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

