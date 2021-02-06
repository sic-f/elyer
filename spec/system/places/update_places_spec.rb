require 'rails_helper'
require 'support/sign_in_helper'

include SignInHelper

feature 'Update places' do
  given(:user)  { create :user }
  given(:place) { create :place, user: user }

  before :example do
    sign_in_as user
    visit "/places/#{place.to_param}/edit"
  end

  scenario 'update a place with valid fields' do
    fill_in 'place[name]', with: 'Aliya Surf Resort'

    click_button 'Submit'

    expect(page).to have_selector 'h1.title', text: 'Aliya Surf Resort'
    expect(page).to have_selector 'div.notification.is-success',
      text: 'Update success!'
  end

  scenario 'updating a place with invalid fields' do
    fill_in 'place[name]', with: ''
    fill_in 'place[address]', with: ''

    click_button 'Submit'

    expect(page).to have_selector 'div.notification.is-danger',
      text: 'Unable to update place.'
    expect(page).to have_selector 'p.help.is-danger', text: 'A name is needed.'
    expect(page).to have_selector 'p.help.is-danger',
      text: 'You need to provide an address or location.'
  end
end
