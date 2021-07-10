require 'application_system_test_case'
require 'support/attachments_helper'
require 'support/sign_in_helper'

class PlacesTest < ApplicationSystemTestCase
  include AttachmentsHelper
  include SignInHelper

  # NEW
  test 'submit a place page' do
    sign_in

    find('.navbar-item.new-place-link').click

    assert_selector 'form#new_place', count: 1
  end

  test 'can not submit a place without logging in' do
    visit '/'

    refute_selector '.navbar-item.new-place-link', count: 1
  end

  # CREATE
  test 'create a place with valid fields' do
    assert_difference 'Place.count', 1 do
      sign_in

      find('.navbar-item.new-place-link').click

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[description]', with: 'Surf beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      fill_in 'place[mobile]', with: '09954636990'
      fill_in 'place[landline]', with: '(02) 952-5463'
      fill_in 'place[email]', with: 'sabang@example.com'
      attach_file 'place[profile_photo]', image_upload_file, visible: false
      attach_file 'place[pictures][]', image_upload_file, visible: false

      click_button 'Submit'
    end

    assert_selector 'div.notification.is-success', text: 'Successfully submitted place!'
    assert_selector 'h1.title', text: 'Sabang Beach'
  end

  test 'create a place with invalid fields' do
    assert_difference 'Place.count', 0 do
      sign_in

      find('.navbar-item.new-place-link').click

      fill_in 'place[name]', with: ''
      fill_in 'place[description]', with: 'Surf beach'
      fill_in 'place[address]', with: ''
      fill_in 'place[mobile]', with: '09954636990'
      fill_in 'place[landline]', with: '(02) 952-5463'
      fill_in 'place[email]', with: 'sabang@example.com'
      attach_file 'place[main_photo]', image_upload_file, visible: false
      attach_file 'place[images][]', image_upload_file, visible: false

      click_button 'Submit'
    end

    assert_selector 'div.notification.is-danger', text: 'Unable to submit place.'
    assert_selector 'p.help.is-danger', text: 'A name is needed.'
    assert_selector 'p.help.is-danger', text: 'You need to provide an address or location.'
  end

  # UPDATE
  test 'update a place with valid fields' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    visit "/places/#{place.to_param}/edit"

    fill_in 'place[name]', with: 'Aliya Surf Resort'

    click_button 'Submit'

    assert_selector 'h1.title', text: 'Aliya Surf Resort'
    assert_selector 'div.notification.is-success', text: 'Update success!'
  end

  test 'updating a place with invalid fields' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    visit "/places/#{place.to_param}/edit"

    fill_in 'place[name]', with: ''
    fill_in 'place[address]', with: ''

    click_button 'Submit'

    assert_selector 'div.notification.is-danger', text: 'Unable to update place.'
    assert_selector 'p.help.is-danger', text: 'A name is needed.'
    assert_selector 'p.help.is-danger', text: 'You need to provide an address or location.'
  end

  # DESTROY
  test 'destroying a place' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    assert_difference 'Place.count', -1 do
      visit "/places/#{place.to_param}"

      accept_alert do
        find('i.fas.fa-trash').click
      end

      assert_selector 'div.notification.is-success', text: 'Place deleted successfuly.'
      assert_selector '.notification.is-info', text: 'There are no places yet.'
    end
  end

  # Image uploads
  test 'upload images of a place increments ActiveStorage::Attachment count' do
    assert_difference 'ActiveStorage::Attachment.count', 1 do
      sign_in

      click_link 'Add'

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[images][]', image_upload_file, visible: false

      click_button 'Submit'
    end
  end

  test 'upload images of a place increments ActiveStorage::Blob count' do
    assert_difference 'ActiveStorage::Blob.count', 1 do
      sign_in

      click_link 'Add'

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[images][]', image_upload_file, visible: false

      click_button 'Submit'
    end
  end

  # Main photo uploads
  test 'upload main photo of a place increments ActiveStorage::Attachment count' do
    assert_difference 'ActiveStorage::Attachment.count', 1 do
      sign_in

      visit new_user_place_path @user

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[main_photo]', image_upload_file, visible: false

      click_button 'Submit'
    end
  end

  test 'upload main photo of a place increments ActiveStorage::Blob count' do
    assert_difference 'ActiveStorage::Blob.count', 1 do
      sign_in

      visit new_user_place_path @user

      fill_in 'place[name]', with: 'Sabang Beach'
      fill_in 'place[address]', with: 'Baler, Aurora'
      attach_file 'place[main_photo]', image_upload_file, visible: false

      click_button 'Submit'
    end
  end

  test 'update main photo of a place does not increment ActiveStorage::Attachment count' do
      user  = create :user
      place = create :place, user: user

      sign_in_as user

      visit edit_place_path place

      attach_file 'place[main_photo]', image_upload_file, visible: false

      click_button 'Submit'

    assert_difference 'ActiveStorage::Attachment.count', 0 do
      visit edit_place_path place

      attach_file 'place[main_photo]', another_image_upload_file, visible: false

      click_button 'Submit'
    end
  end

  test 'update main photo of a place does not increment ActiveStorage::Blob count' do
      user  = create :user
      place = create :place, user: user

      sign_in_as user

      visit edit_place_path place

      attach_file 'place[main_photo]', image_upload_file, visible: false

      click_button 'Submit'

    assert_difference 'ActiveStorage::Blob.count', 0 do
      visit edit_place_path place

      attach_file 'place[main_photo]', another_image_upload_file, visible: false

      click_button 'Submit'
    end
  end

  # Edit link on a Place card in index page
  test 'does not display "EDIT" link when not authorized' do
    user = create :user
    create :place

    sign_in_as user

    visit '/'

    refute_selector '.edit-place-link', text: 'EDIT'
  end

  test 'displays "EDIT" link when authorized' do
    user = create :user
    create :place, user: user

    sign_in_as user

    visit '/'

    assert_selector '.edit-place-link', text: 'EDIT'
  end

  # Edit link on a Place card in show page
  test 'does not display in show page the "EDIT" link when not authorized' do
    user  = create :user
    place = create :place

    sign_in_as user

    visit place_path place

    refute_selector '.edit-place-link', text: 'EDIT'
  end

  test 'displays in show page the "EDIT" link when authorized' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    visit place_path place

    assert_selector '.edit-place-link', text: 'EDIT'
  end

  # Delete (trash can) link on a Place card in show page
  test 'does not display in show page the trash can link when not authorized' do
    user  = create :user
    place = create :place

    sign_in_as user

    visit place_path place

    refute_selector '.trash-can-link'
  end

  test 'displays in show page the trash can link when authorized' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    visit place_path place

    assert_selector '.trash-can-link'
  end
end
