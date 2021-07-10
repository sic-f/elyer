require 'test_helper'
require 'support/attachments_helper'

class PlacesHelperTest < ActionView::TestCase
  include AttachmentsHelper

  test '#profile_picture' do
    profile_picture = build :profile_picture
    place = build :place, profile_picture: profile_picture

    place.profile_picture.image.attach local_file

    assert_kind_of ActiveStorage::VariantWithRecord, profile_picture(place.profile_picture)
  end

  test '#place_main_photo place with no main photo' do
    place = build :place

    assert_equal profile_picture(place.profile_picture), 'no_image.png'
  end
end
