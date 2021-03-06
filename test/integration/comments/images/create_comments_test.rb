require 'test_helper'

class CreateCommentsTest < ActionDispatch::IntegrationTest
  test 'redirects to login page when not authenticated' do
    image = build_stubbed :picture
    params = { comment: {
      content: 'comment',
      commentable_id: image.id,
      commentable_type: 'Image' }
    }

    post "/images/#{image.to_param}/comments", params: params

    assert_response :redirect
    assert_redirected_to '/login'
  end
end
