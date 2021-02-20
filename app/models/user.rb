class User < ApplicationRecord
  include Clearance::User

  has_many :places
  has_many :comments, dependent: :destroy
  has_many :reviews

  has_one_attached :avatar

  with_options presence: true do
    validates :first_name
    validates :last_name
  end

  def name
    "#{first_name} #{last_name}"
  end
end
