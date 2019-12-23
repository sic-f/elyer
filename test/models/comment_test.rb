require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test '#content' do
    comment = build :comment, content: 'That was awesome!'

    assert_equal comment.content, 'That was awesome!'
  end
end
