class Category < ApplicationRecord
  has_many :items

  validates :name, presence: true,exclusion: { in: %w(---) }
end
