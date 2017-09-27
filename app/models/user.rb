class User < ApplicationRecord
  has_many :posts, dependent: :destroy

	has_secure_password
	validates :name, :email, presence: true
end
