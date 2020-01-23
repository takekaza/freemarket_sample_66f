class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :brand
  accepts_nested_attributes_for :brand
  accepts_nested_attributes_for :category
  has_many :images
  accepts_nested_attributes_for :images,allow_destroy: true
  validates :images ,presence: true
  validates :name, presence: true
  validates :price, presence: true
  validates :text, presence: true
  validates :condition, presence: true,exclusion: { in: %w(---) }
  validates :way, presence: true,exclusion: { in: %w(---) }
  validates :date, presence: true,exclusion: { in: %w(---) }
  validates :berser, presence: true,exclusion: { in: %w(---) }
  validates :region, presence: true,exclusion: { in: %w(---) }

end
