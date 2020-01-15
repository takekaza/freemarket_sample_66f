class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :post_number, :prefecture, :city, :town ,presence: true
end
