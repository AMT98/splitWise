class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "Invalid email format" }

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :created_groups, class_name: 'Group', foreign_key: :creator_id
end
