class Bill < ApplicationRecord
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :group
  has_many :payments 
end
