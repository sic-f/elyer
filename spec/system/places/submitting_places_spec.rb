require 'rails_helper'
require 'support/sign_in_helper'
require 'support/attachments_helper'

include SignInHelper
include AttachmentsHelper

RSpec.describe 'Contribute places' do
  scenario 'can not submit a place without logging in' do
    visit '/'

    expect(page).to_not have_selector '.navbar-item.new-place-link'
  end

  scenario 'create a place with valid fields', js: true do
    expect {
      sign_in

      find('.navbar-item.new-place-link').click

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[description]', with: 'Surf beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      fill_in 'place[mobile]', with: '09954636990'
      fill_in 'place[landline]', with: '(02) 952-5463'
      fill_in 'place[email]', with: 'sabang@example.com'
      attach_file 'place[main_photo_attributes][image]', image_upload_file, visible: false
      attach_file 'place[photos][]', image_upload_file, visible: false

      click_button 'Submit'
    }.to change(Place, :count).by 1

    expect(page).to have_selector 'div.notification.is-success',
      text: 'Successfully submitted place!'
    expect(page).to have_selector 'h1.title', text: 'Sabang Beach'
  end

  scenario 'create a place with invalid fields', js: true do
    expect {
      sign_in

      find('.navbar-item.new-place-link').click

      fill_in 'place[name]', with: ''
      fill_in 'place[description]', with: 'Surf beach'
      fill_in 'place[address]', with: ''
      fill_in 'place[mobile]', with: '09954636990'
      fill_in 'place[landline]', with: '(02) 952-5463'
      fill_in 'place[email]', with: 'sabang@example.com'
      attach_file 'place[main_photo_attributes][image]', image_upload_file,
        visible: false
      attach_file 'place[photos][]', image_upload_file, visible: false

      click_button 'Submit'
    }.to_not change(Place, :count)

    expect(page).to have_selector 'div.notification.is-danger',
      text: 'Unable to submit place.'
    expect(page).to have_selector 'p.help.is-danger', text: 'A name is needed.'
    expect(page).to have_selector 'p.help.is-danger',
      text: 'You need to provide an address or location.'
  end
end
