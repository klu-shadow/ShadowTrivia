class Question < ApplicationRecord
  FORMATS = %w[MultipleChoice TrueOrFalse]
  
  belongs_to :user
  
  has_many :taggings
  has_many :categories, through: :taggings

  validates :body, :choices, :correct_answer, :user_id, presence: true
  validates :type, inclusion: { in: FORMATS }
  # validates :correct_answer, inclusion: { in: :choices }
  
  # validate block that includes choices
  # validate :validate_other_description_present

  # def validate_other_description_present
  #   return unless other_description.blank? && reason == 'other'

  #   errors.add(:base, "must include a description if the 'other' option is selected")
  # end
end


# == Schema Information
#
# Table name: questions
#
#  id             :integer(8)      not null, primary key
#  body           :text            not null
#  type           :string
#  choices        :string          default("{}"), not null
#  correct_answer :string          not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  user_id        :integer(4)      not null
#

