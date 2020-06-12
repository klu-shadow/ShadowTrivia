require 'rails_helper'

RSpec.describe Tagging, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

