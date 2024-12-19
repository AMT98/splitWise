class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: :creator_id
  belongs_to :user, foreign_key: :user_id

  has_many :group_memberships
  has_many :users, through: :group_memberships

  after_create :assign_user_id

  private

  def assign_user_id
    update(user_id: creator.id) if user_id.nil?
  end
end
