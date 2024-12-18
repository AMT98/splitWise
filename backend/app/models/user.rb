class User < ApplicationRecord
  has_secure_password
  has_many :groups
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Invalid email format" }
end
