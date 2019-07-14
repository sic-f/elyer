require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit '/'

    assert_selector 'h1', text: 'Pagikan'
  end

  test 'navigation' do
    visit '/'

    assert_selector 'nav.navbar', text: 'Home'
  end

  test 'side navigation' do
    visit '/'

    assert_selector 'aside.menu', text: 'ACCOUNT'
  end
end
