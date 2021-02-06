require 'rails_helper'
require 'support/sign_in_helper'

include SignInHelper

feature 'Delete and edit links public access' do
  scenario 'does not display "EDIT" link when not authorized' do
    user = create :user
    create :place

    sign_in_as user

    visit '/'

    expect(page).to_not have_selector '.edit-place-link', text: 'EDIT'
  end

  scenario 'displays "EDIT" link when authorized' do
    user = create :user
    create :place, user: user

    sign_in_as user

    visit '/'

    expect(page).to have_selector '.edit-place-link', text: 'EDIT'
  end

  scenario 'does not display in show page the "EDIT" link when not authorized' do
    user  = create :user
    place = create :place

    sign_in_as user

    visit place_path place

    expect(page).to_not have_selector '.edit-place-link', text: 'EDIT'
  end

  scenario 'displays in show page the "EDIT" link when authorized' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    visit place_path place

    expect(page).to have_selector '.edit-place-link', text: 'EDIT'
  end

  scenario 'does not display in show page the trash can link when not authorized' do
    user  = create :user
    place = create :place

    sign_in_as user

    visit place_path place

    expect(page).to_not have_selector '.trash-can-link'
  end

  scenario 'displays in show page the trash can link when authorized' do
    user  = create :user
    place = create :place, user: user

    sign_in_as user

    visit place_path place

    expect(page).to have_selector '.trash-can-link'
  end
end
