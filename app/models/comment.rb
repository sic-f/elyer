class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  delegate :email, to: :user, prefix: true, allow_nil: true
  delegate :avatar, to: :user, prefix: true, allow_nil: true
end
