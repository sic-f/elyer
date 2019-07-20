require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
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

  test 'place responds' do
    place = build :place

    assert_equal place.respond_to?(:name), true
  end

  test 'place responds to address' do
    place = build :place

    assert_equal place.respond_to?(:address), true
  end

  test 'place responds to email' do
    place = build :place

    assert_equal place.respond_to?(:email), true
  end
end
