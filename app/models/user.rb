class User < ApplicationRecord
  include Clearance::User

  has_many :places
  has_many :comments, dependent: :destroy

  has_one_attached :avatar

  with_options presence: true do
    validates :first_name
    validates :last_name
  end
end
