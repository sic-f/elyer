require 'rails_helper'

RSpec.describe 'Create comments', type: :request do
  context 'when not authenticated' do
    let(:image) { build_stubbed :photo }
    let(:params) do
      { comment: {
        content: 'comment',
        commentable_id: image.id,
        commentable_type: 'Image' }
      }
    end

    it 'redirects to login page' do
      post "/images/#{image.to_param}/comments", params: params

      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to '/login'
    end
  end
end
