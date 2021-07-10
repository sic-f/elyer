# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = FactoryBot.create :user,
  first_name: 'Loren',
  last_name: 'Burgos',
  email: 'user_1@sanitized.com',
  password: 'workcloud'

15.times do
  FactoryBot.create :place,
    name: FFaker::Venue.name,
    description: FFaker::CheesyLingo.paragraph,
    address: FFaker::AddressJA.street_address,
    mobile: FFaker::PhoneNumberAU.international_mobile_phone_number,
    landline: FFaker::PhoneNumberAU.international_home_work_phone_number,
    email: FFaker::Internet.disposable_email,
    user: user
end
