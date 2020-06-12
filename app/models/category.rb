class Category < ApplicationRecord
  validates :title, presence: true
end


# == Schema Information
#
# Table name: categories
#
#  id         :integer(8)      not null, primary key
#  title      :string          not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer(4)      not null
#

