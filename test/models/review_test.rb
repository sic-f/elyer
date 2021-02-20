require 'test_helper'
require 'support/attachments_helper'

class ReviewTest < ActiveSupport::TestCase
  include AttachmentsHelper

  test '#headline' do
    review = build :review, headline: 'some headline'

    assert_equal review.headline, 'some headline'
  end

  test '#content' do
    review = build :review, content: 'some content'

    assert_equal review.content, 'some content'
  end

  test 'valid when content is not blank' do
    review = build :review, content: 'some content'

    assert review.valid?
  end

  test 'invalid when content is blank' do
    review = build :review, content: nil

    refute review.valid?
  end

  test 'invalid when not associated to a reviewer' do
    review = build :review, reviewer: nil

    refute review.valid?
  end

  test '#reviewer_name' do
      user = build :user, first_name: 'John', last_name: 'Carlos'
    review = build :review, reviewer: user

    assert_equal 'John Carlos', review.reviewer_name
  end

  test '#reviewer_avatar' do
    review = create :review
    review.reviewer.avatar.attach local_file

    assert_instance_of ActiveStorage::Attached::One, review.reviewer_avatar
  end
end
