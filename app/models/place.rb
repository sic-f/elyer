class Place < ApplicationRecord
  has_one :profile_picture, as: :imageable, dependent: :destroy
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :reviews, dependent: :destroy

  belongs_to :user

  validates :name, :address, presence: true

  accepts_nested_attributes_for :profile_picture
  accepts_nested_attributes_for :pictures
end
