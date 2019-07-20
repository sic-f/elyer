require 'test_helper'

class PlacesHelperTest < ActionView::TestCase
  test '#place_layout_class is for showing a place' do
    controller.params = { controller: 'places', action: 'show' }

    assert_equal place_layout_class, 'main-view-item'
  end

  test '#place_layout_class is for the home page' do
    controller.params = { controller: 'pages', action: 'home' }

    assert_equal place_layout_class, 'main-view-item -index'
  end
end
