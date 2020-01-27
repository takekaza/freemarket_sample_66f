class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user, optional: true
  validates :post_number, :prefecture, :city, :town ,presence: true
end
