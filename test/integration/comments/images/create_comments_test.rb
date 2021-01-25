require 'test_helper'

class CreateCommentsTest < ActionDispatch::IntegrationTest
  test 'not allowed to make comments when not authenticated' do
     image = build_stubbed :photo
    params = { comment: {
                content: 'comment',
                commentable_id: image.id,
                commentable_type: 'Image'
             }}

    post "/images/#{image.to_param}/comments", params: params

    assert_response :redirect
    assert_redirected_to '/login'
  end
end
