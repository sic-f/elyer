require 'rails_helper'
require 'support/attachments_helper'
include AttachmentsHelper

RSpec.describe PlacesHelper, type: :helper do
  it '#place_main_photo' do
    main_photo = build :main_photo
    place      = build :place, main_photo: main_photo

    place.main_photo.image.attach local_file

    expect(helper.place_main_photo(main_photo)).
      to be_kind_of ActiveStorage::VariantWithRecord
  end

  it '#place_main_photo place with no main photo' do
    place = build :place

    expect(helper.place_main_photo(place.main_photo)).to eq 'no_image.png'
  end
end


