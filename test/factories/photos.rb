FactoryBot.define do
  factory :photo do
    caption { FFaker::HTMLIpsum.fancy_string }
    place
  end
end
