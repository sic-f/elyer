class Place < ApplicationRecord
  validates :name, :address, presence: true

  has_many_attached :images
end
