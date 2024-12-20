class Payment < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :payer_id, presence: true
  validates :receiver_id, presence: true
end
