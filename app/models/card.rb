class Card < ApplicationRecord
  belongs_to :user
  validates :id, :card_id, :customer_id, :user_id, presence: true
end
