require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit '/'

    assert_selector 'h1', text: 'Pagikan'
  end

  test 'navigation bar' do
    visit '/'

    assert_selector 'nav.navbar', text: 'Home'
  end

  test 'side navigation' do
    visit '/'

    assert_selector 'aside.menu', text: 'ACCOUNT'
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
