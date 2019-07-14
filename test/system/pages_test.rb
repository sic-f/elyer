require "application_system_test_case"

class PagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit '/'

    assert_selector 'h1', text: 'Pagikan'
  end
end
