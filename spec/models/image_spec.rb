require 'rails_helper'

RSpec.describe Image, type: :model do
  it '#caption' do
    image = create :image, caption: 'On the way to the beach.'

    expect(image.caption).to eq 'On the way to the beach.'
  end
end
