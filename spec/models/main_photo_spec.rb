require 'rails_helper'

RSpec.describe MainPhoto, type: :model do
  it '#caption' do
    main_photo = create :main_photo, caption: 'The front porch of the hotel.'

    expect(main_photo.caption).to eq 'The front porch of the hotel.'
  end

  it '#type' do
    main_photo = create :main_photo

    expect(main_photo.type).to eq 'MainPhoto'
  end
end
