require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'navigation bar' do
    visit '/'

    assert_selector 'nav.navbar', text: 'Balai'
  end

  test 'side navigation' do
    visit '/'

    assert_selector 'aside.menu', text: 'HOME'
  end

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
