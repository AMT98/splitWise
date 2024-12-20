class Bill < ApplicationRecord
  belongs_to :payer
  belongs_to :group
end
