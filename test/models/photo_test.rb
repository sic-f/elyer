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
end
