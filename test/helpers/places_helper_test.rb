require 'test_helper'
require 'support/attachments_helper'

class PlacesHelperTest < ActionView::TestCase
  include AttachmentsHelper

  test '#place_main_photo' do
    main_photo = build :main_photo
    place      = build :place, main_photo: main_photo

    place.main_photo.image.attach local_file

    assert_kind_of ActiveStorage::VariantWithRecord, place_main_photo(place.main_photo)
  end

  test '#place_main_photo place with no main photo' do
    place = build :place

    assert_equal place_main_photo(place.main_photo), 'no_image.png'
  end
end
