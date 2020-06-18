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

class User < ApplicationRecord
  ROLES = %w[admin standard].freeze
  
  has_many :categories
  has_many :questions
  has_many :games
  
  validates :first_name, :last_name, presence: true, length: { maximum: 25 }
  validates :email, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
  validates :email, :password_digest, :session_token, uniqueness: true
  validates :password, length: {minimum: 6, message: "is too short, minimum 6 characters."}, allow_nil: true, confirmation: true
  validates :password_confirmation, presence: true, allow_nil: true


  attr_reader :password
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil unless user && user.is_password?(password)
    user
  end

  def self.create_dummy(first_name, last_name, email, password)
    user = User.new(
      first_name: first_name, 
      last_name: last_name, 
      email: email, 
      password: password
    ).save!
  end

  def logged_in? 
    true
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  # def password_confirmation=(password_confirmation)
  #   @password_confirmation = password_confirmation
  # end

  def is_password?(password)
    #convert digest string to BCrypt password object
    bcp = BCrypt::Password.new(self.password_digest)
    bcp.is_password?(password)
  end

  def reset_session_token! 
    self.update!(session_token: self.class.generate_session_token)
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end  

