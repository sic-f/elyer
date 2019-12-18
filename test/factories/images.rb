FactoryBot.define do
  factory :image do
    caption { FFaker::HTMLIpsum.fancy_string }
    type { 'main_photo' }
    place
  end
end
