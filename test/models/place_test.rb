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

  test 'invalid without user' do
    place = build :place, user: nil

    refute place.valid?
  end

  test '#images' do
    place = build :place

    place.images.attach(local_file)

    assert_equal place.images.attached?, true
  end

  test '#main_photo' do
    place = build :place

    place.main_photo.attach(local_file)

    assert_equal place.main_photo.attached?, true
  end

  test 'does not increase ActiveStorage::Attachment.count' do
    place = build :place
    place.main_photo.attach local_file
    place.save

    assert_difference 'ActiveStorage::Attachment.count', 0 do
      place.main_photo.attach local_file
      place.save
    end
  end
end
