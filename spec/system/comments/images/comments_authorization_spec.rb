require 'rails_helper'
require 'support/attachments_helper'
include AttachmentsHelper

RSpec.describe 'Comments authorization', type: :system, js: true do
  context 'when not logged in' do
    let(:photo) { create :photo }
    let(:place) { create :place, photos: [photo] }

    before :example do
      place.photos.first.photo.attach local_file
    end

    it 'does not render comment text box' do
      visit "/images/#{photo.to_param}"

      expect(page).to_not have_selector '#comment_content'
    end
  end
end
