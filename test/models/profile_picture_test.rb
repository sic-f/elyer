require "test_helper"

class ProfilePictureTest < ActiveSupport::TestCase
  test '#caption' do
    profile_picture = build :profile_picture, caption: 'A beautiful sunset.'

    assert_equal 'A beautiful sunset.', profile_picture.caption
  end

  test '#type' do
    profile_picture = build :profile_picture

    assert_equal 'ProfilePicture', profile_picture.type
  end

  test '#user' do
    user = build_stubbed :user
    place = build_stubbed :place, user: user
    profile_picture = build_stubbed :profile_picture, imageable: place

    assert_equal profile_picture.user, user
  end
end
