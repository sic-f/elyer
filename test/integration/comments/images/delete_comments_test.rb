require 'test_helper'

class DeleteCommentsTests < ActionDispatch::IntegrationTest
  test 'raises error when not authenticated' do
    user       = create :user
    other_user = create :user
    place      = create :place, user: user
    image      = create :profile_picture, imageable: place
    comment    = create :comment, commentable: image, user: user

    assert_raises Pundit::NotAuthorizedError do
      delete "/comments/#{comment.to_param}"
    end
  end

  test 'raises authorization error when not own comment' do
    user       = create :user
    other_user = create :user
    place      = create :place, user: user
    image      = create :profile_picture, imageable: place
    comment    = create :comment, commentable: image, user: user

    get root_path(as: other_user)

    assert_raises Pundit::NotAuthorizedError do
      delete "/comments/#{comment.to_param}"
    end
  end
end
