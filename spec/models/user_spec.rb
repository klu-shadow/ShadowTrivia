require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: users
#
#  id              :integer(8)      not null, primary key
#  first_name      :string          not null
#  last_name       :string          not null
#  email           :string          not null
#  password_digest :string          not null
#  session_token   :string          not null
#  role            :string          default("standard")
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

