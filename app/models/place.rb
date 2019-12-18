class Place < ApplicationRecord
  has_one :main_photo
  has_many :photos

  belongs_to :user

  validates :name, :address, presence: true
end
