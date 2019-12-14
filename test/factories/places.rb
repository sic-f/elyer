FactoryBot.define do
  factory :place do
    name { 'Sabang Beach' }
    description { 'Surf beach.' }
    address { 'Baler, Aurora' }
    mobile { 'n/a' }
    landline { 'n/a' }
    email { 'sabang@example.com' }
    user
  end
end
