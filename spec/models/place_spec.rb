require 'rails_helper'
require 'support/attachments_helper'
include AttachmentsHelper

RSpec.describe Place, type: :model do

  it 'valid place' do
    place = build :place

    expect(place).to be_valid
  end

  it 'invalid without name' do
    place = build :place, name: nil

    expect(place).to_not be_valid
  end

  it 'invalid without address' do
    place = build :place, address: nil

    expect(place).to_not be_valid
  end

  it 'invalid without user' do
    place = build :place, user: nil

    expect(place).to_not be_valid
  end

  it '#main_photo' do
    place = build :place
    build :main_photo, place: place

    place.main_photo.image.attach(local_file)

    expect(place.main_photo.image).to be_attached
  end

  it 'does not increase ActiveStorage::Attachment.count' do
    place = build :place
    build :main_photo, place: place

    place.main_photo.image.attach local_file
    place.save

    expect {
      place.main_photo.image.attach local_file
      place.save
    }.to_not change(ActiveStorage::Attachment, :count)
  end
end
