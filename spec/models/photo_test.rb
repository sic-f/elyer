require 'test_helper'

class PhotoTest < ActiveSupport::TestCase
  test '#caption' do
    photo = create :photo, caption: 'A beautiful sunset.'

    assert_equal 'A beautiful sunset.', photo.caption
  end

  test '#type' do
    photo = create :photo

    assert_equal 'Photo', photo.type
  end

  test '#user' do
    user  = build_stubbed :user
    place = build_stubbed :place, user: user
    photo = build_stubbed :photo, place: place

    assert_equal photo.user, user
  end
end
