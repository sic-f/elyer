FactoryBot.define do
  factory :user do
    first_name { FFaker::NamePH.first_name_female }
    last_name { FFaker::NamePH.last_name }
    email { FFaker::Internet.safe_email }
    password { FFaker::Internet.password }
  end
end
