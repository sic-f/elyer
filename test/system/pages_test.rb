require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'index page has no places' do
    visit '/'

    assert_selector '.notification', text: 'There are no places yet.'
  end

  test 'index page has places' do
    create :place

    visit '/'

    assert_selector '.title', text: 'Sabang Beach'
  end
end
