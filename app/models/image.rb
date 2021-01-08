class Image < ApplicationRecord
  has_many :comments, as: :commentable
  belongs_to :place
end
