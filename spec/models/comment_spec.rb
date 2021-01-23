require 'rails_helper'

RSpec.describe Comment, type: :model do
  it '#content' do
    comment = build :comment, content: 'That was awesome!'

    expect(comment.content).to eq 'That was awesome!'
  end
end
