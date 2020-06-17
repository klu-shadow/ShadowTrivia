class Tagging < ApplicationRecord
  
  validates :category_id, :question_id, presence: true
  validates :category_id, uniqueness: { scope: :question_id }
  belongs_to :category
  belongs_to :question
  
  def self.build(params, question_id)
    category_ids = params[:category].values
    Tagging.transaction do
      category_ids.each do |category_id|
        Tagging.create!(category_id: category_id, question_id: question_id)
      end
    end
  end
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

