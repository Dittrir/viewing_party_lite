require 'bcrypt'

class User < ApplicationRecord
  include BCrypt

  has_many :user_parties
  has_many :parties, through: :user_parties

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
            :presence => {message: "can't be blank"},
            :uniqueness => true
  validates :name,
            :presence => {message: "can't be blank"}
  validates :password_digest,
            :presence => true

  has_secure_password


  def self.except_self(user)
    where.not(id: user.id)
  end
end
