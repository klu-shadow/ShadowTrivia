require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  context 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:first_name).is_at_most(25) }
    it { should validate_length_of(:last_name).is_at_most(25) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:role) }
    it { should validate_inclusion_of(:role).in_array(User::ROLES) }
  end

  context 'is_password?' do
    it 'returns true if password is correct' do
      expect(subject.is_password?(subject.password)).to be true
    end

    it 'returns false if password is incorrect' do
      random_password = 'thisshouldreturnfalse123!'
      expect(subject.is_password?(random_password))
    end
  end

  context '#reset_session_token' do
      it 'resets the session token' do
        user = build(:user)
        first_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).not_to eq(first_token)
      end

  end



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

