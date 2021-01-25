require 'rails_helper'

RSpec.describe 'Edit comments', type: :request do
  context 'when not authenticated' do
    it 'raises error' do
         user = create :user
        place = create :place, user: user
        image = create :main_photo, place: place
      comment = create :comment, commentable: image, user: user

      expect {get "/comments/#{comment.to_param}/edit"}
        .to raise_error Pundit::NotAuthorizedError
    end
  end

  it 'edit own comment only' do
       user = create :user
      place = create :place, user: user
      image = create :main_photo, place: place
    comment = create :comment, commentable: image, user: user

    other_user = create :user

    get root_path(as: other_user)

    expect {get "/comments/#{comment.to_param}/edit"}
      .to raise_error Pundit::NotAuthorizedError
  end
end
