require 'application_system_test_case'

class SignUpTest < ApplicationSystemTestCase
  test 'account creation page' do
    visit '/'

    find('.navbar-item.sign-up-link').click

    assert_selector 'h1.title', text: 'Sign up'
    assert_selector '.user-authentication-form'
  end

  test 'successfully created an account' do
    first_name = FFaker::NamePH.first_name_female
    last_name  = FFaker::NamePH.last_name

    assert_difference 'User.count', 1 do
      visit '/signup'

      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    assert_selector 'div.notification.is-success',
                    text: "Welcome #{first_name} #{last_name}!"
  end

  test 'no email' do
    first_name = FFaker::NamePH.first_name_female
    last_name  = FFaker::NamePH.last_name

    assert_difference 'User.count', 0 do
      visit '/'
      click_link 'Sign up'

      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      fill_in 'user[email]', with: nil
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    assert_selector '.help.user-email', text: 'is invalid'
    refute_selector 'div.notification.is-success',
                    text: "Welcome #{first_name} #{last_name}!"
  end

  test 'no first name' do
    last_name = FFaker::NamePH.last_name

    assert_difference 'User.count', 0 do
      visit '/'
      click_link 'Sign up'

      fill_in 'user[first_name]', with: nil
      fill_in 'user[last_name]', with: last_name
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    assert_selector '.help.user-first-name', text: "can't be blank"
    refute_selector 'div.notification.is-success',
                    text: "Welcome Maris #{last_name}!"
  end

  test 'no last name' do
    first_name = FFaker::NamePH.first_name_female

    assert_difference 'User.count', 0 do
      visit '/'
      click_link 'Sign up'

      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: nil
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    assert_selector '.help.user-last-name', text: "can't be blank"
    refute_selector 'div.notification.is-success',
                    text: "Welcome #{first_name} Racal!"
  end

  test 'no password' do
    first_name = FFaker::NamePH.first_name_female
    last_name  = FFaker::NamePH.last_name

    assert_difference 'User.count', 0 do
      visit '/'
      click_link 'Sign up'

      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: nil

      click_button 'Create Account'
    end

    assert_selector '.help.user-password', text: "can't be blank"
    refute_selector 'div.notification.is-success',
                    text: "Welcome #{first_name} #{last_name}!"
  end
end
