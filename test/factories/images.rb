FactoryBot.define do
  factory :image do
    caption { FFaker::HTMLIpsum.fancy_string }
  end
end
