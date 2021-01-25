require 'test_helper'

class DeleteComments < ActionDispatch::IntegrationTest
  test 'raises error when not authenticated' do
          user = create :user
    other_user = create :user
         place = create :place, user: user
         image = create :main_photo, place: place
       comment = create :comment, commentable: image, user: user

    assert_raises Pundit::NotAuthorizedError do
      delete "/comments/#{comment.to_param}"
    end
  end

  test 'raises authorization error when not own comment' do
          user = create :user
    other_user = create :user
         place = create :place, user: user
         image = create :main_photo, place: place
       comment = create :comment, commentable: image, user: user

    get root_path(as: other_user)

    assert_raises Pundit::NotAuthorizedError do
      delete "/comments/#{comment.to_param}"
    end
  end
end
