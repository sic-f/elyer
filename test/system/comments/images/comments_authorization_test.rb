require 'application_system_test_case'
require 'support/attachments_helper'

include AttachmentsHelper

class CommentsAuthorizationTest < ApplicationSystemTestCase
  test 'does not render comment text box when not authenticated' do
    given_a_place_with_photo
    when_user_goes_to_the_photo_page

    assert_no_selector '#comment_content'
  end

  private
    def given_a_place_with_photo
      @photo = create :photo
       place = create :place, photos: [@photo]

      place.photos.first.photo.attach local_file
    end

    def when_user_goes_to_the_photo_page
      visit "/images/#{@photo.to_param}"
    end
end
