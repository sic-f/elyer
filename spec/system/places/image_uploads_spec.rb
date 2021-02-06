require 'rails_helper'
require 'support/sign_in_helper'
require 'support/attachments_helper'

include SignInHelper
include AttachmentsHelper

feature 'Place image uploads' do
  scenario 'upload images of a place increments ActiveStorage::Attachment count' do
    expect {
      sign_in

      click_link 'Add'

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[photos][]', image_upload_file, visible: false

      click_button 'Submit'
    }.to change(ActiveStorage::Attachment, :count).by 1
  end

  scenario 'upload images of a place increments ActiveStorage::Blob count' do
    expect {
      sign_in

      click_link 'Add'

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[photos][]', image_upload_file, visible: false

      click_button 'Submit'
    }.to change(ActiveStorage::Blob, :count).by 1
  end

  scenario 'upload main photo of a place increments ActiveStorage::Attachment
    count' do
    expect {
      sign_in

      visit new_user_place_path @user

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[main_photo_attributes][image]', image_upload_file,
        visible: false

      click_button 'Submit'
    }.to change(ActiveStorage::Attachment, :count).by 1
  end

  scenario 'upload main photo of a place increments ActiveStorage::Blob count' do
    expect {
      sign_in

      visit new_user_place_path @user

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[main_photo_attributes][image]', image_upload_file,
        visible: false

      click_button 'Submit'
    }.to change(ActiveStorage::Blob, :count).by 1
  end

  scenario 'update main photo of a place does not increment
    ActiveStorage::Attachment count' do
      user  = create :user
      place = create :place, user: user

      place.create_main_photo.image.attach local_file

      sign_in_as user

    expect {
      visit edit_place_path place

      attach_file 'place[main_photo_attributes][image]',
        another_image_upload_file, visible: false

      click_button 'Submit'
    }.to_not change(ActiveStorage::Attachment, :count)
  end

  scenario 'update main photo of a place does not increment
    ActiveStorage::Blob count' do
      user  = create :user
      place = create :place, user: user

      place.create_main_photo.image.attach local_file

      sign_in_as user

    expect {
      visit edit_place_path place

      attach_file 'place[main_photo_attributes][image]',
        another_image_upload_file, visible: false

      click_button 'Submit'
    }.to_not change(ActiveStorage::Blob, :count)
  end
end
