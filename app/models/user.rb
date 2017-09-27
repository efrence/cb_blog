require 'bcrypt'
class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  validates :name, :email, presence: true
end
