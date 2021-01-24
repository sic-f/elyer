require 'rails_helper'

RSpec.describe 'Delete comments', type: :request do
  let(:user)       { create :user }
  let(:other_user) { create :user }
  let(:place)      { create :place, user: user }
  let(:image)      { create :main_photo, place: place}
  let(:comment)    { create :comment, commentable: image, user: user}

  context 'when not authenticated' do
    it 'raises error' do
      expect {delete "/comments/#{comment.to_param}"}
        .to raise_error Pundit::NotAuthorizedError
    end
  end

  context 'when not own comment' do
    it 'raises authorization error' do
      get root_path(as: other_user)

      expect {delete "/comments/#{comment.to_param}"}
        .to raise_error Pundit::NotAuthorizedError
    end
  end
end
