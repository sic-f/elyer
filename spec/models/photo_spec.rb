require 'rails_helper'

RSpec.describe Photo, type: :model do
  it '#caption' do
    photo = create :photo, caption: 'A beautiful sunset.'

    expect(photo.caption).to eq 'A beautiful sunset.'
  end

  it '#type' do
    photo = create :photo

    expect(photo.type).to eq 'Photo'
  end

  it '#user' do
    user  = build_stubbed :user
    place = build_stubbed :place, user: user
    photo = build_stubbed :photo, place: place

    expect(photo.user).to eq user
  end
end
