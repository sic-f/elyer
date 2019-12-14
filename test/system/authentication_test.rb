require 'application_system_test_case'

class AuthenticationTest < ApplicationSystemTestCase
  test 'login page' do
    visit '/'
    click_link 'Sign in'

    assert_selector 'h1.title', text: 'Sign in'
    assert_selector '.user-authentication-form'
    assert_selector '.sign-up-link', text: 'Sign up'
    assert_selector '.forgot-password-link', text: 'Forgot password?'
  end

  test 'successful login' do
    user = create :user

    visit '/login'

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: user.password

    click_button 'Sign in'

    assert_selector '.navbar-item.new-place-link'
    assert_selector '.navbar-item.sign-out-link'
    refute_selector '.navbar-item.sign-in-link'
  end

  test 'unsuccessful login' do
    user = create :user

    visit '/login'

    fill_in 'session[email]', with: user.email
    fill_in 'session[password]', with: 'wrongpassword'

    click_button 'Sign in'

    refute_selector '.navbar-item.new-place-link'
    refute_selector '.navbar-item.sign-out-link'
    assert_selector 'div.notification.is-danger', text: 'Bad email or password.'
  end

  test 'blank email and password' do
    visit '/login'

    fill_in 'session[email]', with: nil
    fill_in 'session[password]', with: nil

    click_button 'Sign in'

    refute_selector '.navbar-item.new-place-link'
    refute_selector '.navbar-item.sign-out-link'
    assert_selector 'div.notification.is-danger', text: 'Bad email or password.'
  end
end
