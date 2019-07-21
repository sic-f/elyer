require 'test_helper'
require 'support/attachments_helper'

class PlaceTest < ActiveSupport::TestCase
  include AttachmentsHelper

  test 'valid place' do
    place = build :place

    assert place.valid?
  end

  test 'invalid without name' do
    place = build :place, name: nil

    refute place.valid?
  end

  test 'invalid without address' do
    place = build :place, address: nil

    refute place.valid?
  end

  test 'image upload' do
    place = build :place

    place.images.attach image_upload_file

    assert_equal place.images.attached?, true
  end
end
