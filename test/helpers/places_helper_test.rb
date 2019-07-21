require 'test_helper'
require 'support/attachments_helper'

class PlacesHelperTest < ActionView::TestCase
  include AttachmentsHelper

  test '#place_layout_class is for showing a place' do
    controller.params = { controller: 'places', action: 'show' }

    assert_equal place_layout_class, 'main-view-item'
  end

  test '#place_layout_class is for the home page' do
    controller.params = { controller: 'pages', action: 'home' }

    assert_equal place_layout_class, 'main-view-item -index'
  end

  test '#place_photos' do
    place = build :place

    place.main_photo.attach local_file

    assert_equal place_photos(place.main_photo), place.main_photo
  end

  test '#place_photos place with no main photo' do
    place = build :place

    assert_equal place_photos(place.main_photo), 'no_image.png'
  end
end
