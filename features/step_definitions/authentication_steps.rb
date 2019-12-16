# Successful login
When(/^I fill in the required fields to log in$/) do
  user = create :user

  fill_in 'session[email]', with: user.email
  fill_in 'session[password]', with: user.password
end

Then(/^I should be on the home page with signed in state$/) do
  assert_selector '.navbar-item.new-place-link'
  assert_selector '.navbar-item.sign-out-link'
  assert_no_selector '.navbar-item.sign-in-link'
end

# Unsuccessful login
# wrong password
When(/^I fill in the required fields to log in with wrong password$/) do
  user = create :user

  fill_in 'session[email]', with: user.email
  fill_in 'session[password]', with: 'wrongpassword'
end

Then(/^I should still be on the sign in page$/) do
  assert_no_selector '.navbar-item.new-place-link'
  assert_no_selector '.navbar-item.sign-out-link'
  assert_selector 'div.notification.is-danger', text: 'Bad email or password.'
  assert_no_current_path '/'
  assert_current_path '/session'
end

# blank email and password
When(/^I leave the log in fields blank$/) do
  fill_in 'session[email]', with: nil
  fill_in 'session[password]', with: nil
end

# Logout
Then(/^I should be redirected to the log in page$/) do
  assert_text 'Sign in'
  assert_no_selector '.navbar-item.new-place-link'
  assert_no_selector '.navbar-item.sign-out-link'
  assert_selector '.home-link'
  assert_selector '.sign-up-link'
  assert_current_path '/login'
end

# "Account" and "Your Contributions" link not visible when not signed in
When(/^I am on the home page and not signed in$/) do
  visit_home_page
end

Then(/^The "Account" and "Your Contributions" links are not visible$/) do
  assert_no_selector '.navbar-item.account-link', text: 'Account'
  assert_no_selector '.navbar-item.user-contributions-link', text: 'Your Contributions'
end

# "Profile" and "Your Contributions" sidebar links not visible
Then(/^The "Profile" and "Your Contributions" links are not visible$/) do
  assert_no_selector '.menu-item.profile-link', text: 'Account'
  assert_no_selector '.menu-item.user-contributions-link', text: 'Your Contributions'
end

