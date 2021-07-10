require "test_helper"

class PictureTest < ActiveSupport::TestCase
  test '#caption' do
    picture = build :picture, caption: 'A beautiful sunset.'

    assert_equal 'A beautiful sunset.', picture.caption
  end

  test '#type' do
    picture = build :picture

    assert_equal 'Picture', picture.type
  end

  test '#user' do
    user = build_stubbed :user
    place = build_stubbed :place, user: user
    picture = build_stubbed :picture, imageable: place

    assert_equal picture.user, user
  end
end
