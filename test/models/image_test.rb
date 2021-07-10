require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test '#caption' do
    image = build :image, caption: 'On the way to the beach.'

    assert_equal 'On the way to the beach.', image.caption
  end
end
