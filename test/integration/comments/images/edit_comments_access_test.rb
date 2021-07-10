require 'test_helper'

class EditCommentsAccessTest < ActionDispatch::IntegrationTest
  test 'requires log in' do
       user = create :user
      place = create :place, user: user
      image = create :profile_picture, imageable: place
    comment = create :comment, commentable: image, user: user

    assert_raises Pundit::NotAuthorizedError do
      get "/comments/#{comment.to_param}/edit"
    end
  end

  test 'edit own comment only' do
       user = create :user
      place = create :place, user: user
      image = create :profile_picture, imageable: place
    comment = create :comment, commentable: image, user: user

    other_user = create :user

    get root_path(as: other_user)

    assert_raises Pundit::NotAuthorizedError do
      get "/comments/#{comment.to_param}/edit"
    end
  end
end
