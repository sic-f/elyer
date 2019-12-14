class Place < ApplicationRecord
  belongs_to :user

  has_one_attached :main_photo
  has_many_attached :images

  validates :name, :address, presence: true
end
