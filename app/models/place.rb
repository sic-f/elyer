class Place < ApplicationRecord
  has_one :main_photo, dependent: :destroy
  has_many :photos, dependent: :destroy

  belongs_to :user

  validates :name, :address, presence: true

  accepts_nested_attributes_for :main_photo
  accepts_nested_attributes_for :photos
end
