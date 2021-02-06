require 'rails_helper'

feature 'Pages' do
  scenario 'index page has no places' do
    visit '/'

    expect(page).to have_selector '.notification', text: 'There are no places yet.'
  end

  scenario 'index page has places' do
    create :place

    visit '/'

    expect(page).to have_selector '.title', text: 'Sabang Beach'
  end
end
