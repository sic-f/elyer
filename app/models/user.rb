class User < ApplicationRecord
  include Clearance::User

  with_options presence: true do
    validates :first_name
    validates :last_name
  end
end
