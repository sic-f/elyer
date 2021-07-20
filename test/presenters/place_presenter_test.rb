require 'test_helper'
require 'support/attachments_helper'

class Places::PresenterTest < ActiveSupport::TestCase
  include AttachmentsHelper

  test '#reviewer_thumbnail returns active storage variant' do
    user = create :user
    user.avatar.attach local_file
    place = build :place, user: user

    presenter = Places::Presenter.new(place)

    assert_instance_of ActiveStorage::VariantWithRecord,
      presenter.reviewer_thumbnail(user.avatar)
  end

  test '#reviewer_thumbnail returns string when reviewer has no avatar' do
    user = create :user
    place = build :place, user: user

    presenter = Places::Presenter.new(place)

    assert_instance_of String,
      presenter.reviewer_thumbnail(user.avatar)
  end

  test '#website as nil' do
    place = build :place, website: nil
    presenter = Places::Presenter.new(place)

    assert_equal '', presenter.website_link, 'Should return empty string'
  end

  test '#website with value' do
    place = build :place, website: 'taranaaba.com'
    presenter = Places::Presenter.new(place)

    assert_equal "https://taranaaba.com", presenter.website_link

    place.website = 'www.taranaaba.com'
    assert_equal "https://www.taranaaba.com", presenter.website_link

    place.website = 'https://www.taranaaba.com'
    assert_equal "https://www.taranaaba.com", presenter.website_link
  end

  test '#facebook with nil value' do
    place = build :place, facebook: nil
    presenter = Places::Presenter.new(place)

    assert_equal "", presenter.facebook_link
  end

  test '#facebook with value' do
    place = build :place, facebook: 'facebook.com/kpineds'
    presenter = Places::Presenter.new(place)

    assert_equal "https://facebook.com/kpineds", presenter.facebook_link
  end

  test '#more_details_margin when not authenticated' do
    place = build :place
    presenter = Places::Presenter.new(place)
    is_signed_in = false

    assert_equal 'pr-4', presenter.more_details_margin(is_signed_in)
  end

  test '#more_details_margin when authenticated' do
    place = build :place
    presenter = Places::Presenter.new(place)
    is_signed_in = true

    assert_nil presenter.more_details_margin(is_signed_in)
  end
end
