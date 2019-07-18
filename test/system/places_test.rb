require "application_system_test_case"

class PlacesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit places_url
  #
  #   assert_selector "h1", text: "Place"
  # end

  test 'submit a place page' do
    visit '/'

    find('.navbar-item > a').click

    assert_selector 'form#new_place', count: 1
  end

  test 'create a place' do

    assert_difference 'Place.count', 1 do
      visit '/'

      find('.navbar-item > a').click

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[description]', with: 'Surf beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      fill_in 'place[mobile]', with: '09954636990'
      fill_in 'place[landline]', with: '(02) 952-5463'
      fill_in 'place[email]', with: 'sabang@example.com'

      click_button 'Submit'
    end

    assert_selector 'div.notification.is-success', text: 'Successfully submitted place!'
    assert_selector 'h2.name', text: 'Sabang Beach'
  end
end
