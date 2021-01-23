FactoryBot.define do
  factory :main_photo do
    caption { FFaker::HTMLIpsum.fancy_string }
    place
  end
end
