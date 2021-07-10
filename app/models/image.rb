class Image < ApplicationRecord
  has_one_attached :image
  has_many :comments, as: :commentable
  belongs_to :imageable, polymorphic: true

  delegate :user, to: :imageable
end
