require 'rails_helper'
require 'support/sign_in_helper'

include SignInHelper

feature 'Delete places', type: :system do
  given!(:user)  { create :user }
  given!(:place) { create :place, user: user }

  scenario 'destroying a place', js: true do
    sign_in_as user

    expect {
      visit "/places/#{place.to_param}"

      accept_alert do
        find('i.fas.fa-trash').click
      end

      expect(page).to have_selector 'div.notification.is-success',
        text: 'Place deleted successfuly.'
      expect(page).to have_selector '.notification.is-info',
        text: 'There are no places yet.'
    }.to change(Place, :count).by -1
  end
end
