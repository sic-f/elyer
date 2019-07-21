class Place < ApplicationRecord
  validates :name, :address, presence: true

  has_one_attached :main_photo
  has_many_attached :images
end
