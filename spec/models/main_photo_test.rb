require 'test_helper'

class MainPhotoTest < ActiveSupport::TestCase
  test '#caption' do
    main_photo = create :main_photo, caption: 'The front porch of the hotel.'

    assert_equal 'The front porch of the hotel.', main_photo.caption
  end

  test '#type' do
    main_photo = create :main_photo

    assert_equal 'MainPhoto', main_photo.type
  end
end
