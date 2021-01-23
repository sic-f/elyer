require 'rails_helper'

RSpec.describe 'Pages', type: :system do
  it 'index page has no places' do
    visit '/'

    expect(page).to have_selector '.notification', text: 'There are no places yet.'
  end

  it 'index page has places' do
    create :place

    visit '/'

    expect(page).to have_selector '.title', text: 'Sabang Beach'
  end
end
