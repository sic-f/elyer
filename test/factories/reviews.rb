FactoryBot.define do
  factory :review do
    content { 'A review.' }
    reviewer factory: :user
    place
  end
end
