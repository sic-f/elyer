require 'rails_helper'

RSpec.describe 'Delete comments', type: :request do
  context 'when not authenticated' do
    it 'raises error' do
         user = create :user
        place = create :place, user: user
        image = create :main_photo, place: place
      comment = create :comment, commentable: image, user: user

      expect {delete "/comments/#{comment.to_param}"}
        .to raise_error Pundit::NotAuthorizedError
    end
  end

  context 'when not own comment' do
    it 'raises authorization error' do
         user = create :user
        place = create :place, user: user
        image = create :main_photo, place: place
      comment = create :comment, commentable: image, user: user

      other_user = create :user

      get root_path(as: other_user)

      expect {delete "/comments/#{comment.to_param}"}
        .to raise_error Pundit::NotAuthorizedError
    end
  end
end
