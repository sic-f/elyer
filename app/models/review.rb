class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :place

  validates :content, presence: true

  delegate :name, :avatar, to: :reviewer, prefix: true
end
