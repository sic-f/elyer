class User < ApplicationRecord
  include Clearance::User

  has_many :places

  with_options presence: true do
    validates :first_name
    validates :last_name
  end
end
