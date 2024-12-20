class Bill < ApplicationRecord
  belongs_to :payer, class_name: 'User'
  belongs_to :group
end
