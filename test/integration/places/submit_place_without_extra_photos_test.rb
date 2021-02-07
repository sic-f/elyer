require 'test_helper'
require 'support/sign_in_helper'

class SubmitPlaceWithoutExtraPhotosTest < ActionDispatch::IntegrationTest
  include SignInHelper::IntegrationTests

  test 'submit place without extra photos' do
    given_a_signed_in_user
    when_user_submits_place_without_extra_photos

    assert_select 'div.notification', 'Successfully submitted place!'
  end

  private
    def given_a_signed_in_user
      sign_in
    end

    def when_user_submits_place_without_extra_photos
      params = { place:
                 { name: FFaker::Company.name,
                   address: FFaker::Address.city }}

      post "/users/#{@user.to_param}/places", params: params

      assert_response :redirect
      follow_redirect!
      assert_response :success
    end
end
