class Payment < ApplicationRecord
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
  belongs_to :bill  

  validates :amount, presence: true
  validates :payer_id, presence: true
  validates :receiver_id, presence: true
  validates :bill_id, presence: true
end
