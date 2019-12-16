Given(/^I am on the home page$/) do
  visit_home_page
end

Given(/^user is on the home page$/) do
  visit_home_page
end

Given(/^I am on the sign up page$/) do
  visit_sign_up_page
end

Given(/^I am on the sign in page$/) do
  visit_login_page
end

And(/^I click on "([^"]*)" link$/) do |link|
  click_link link
end

And(/^user clicks on "([^"]*)" link$/) do |link|
  click_link link
end

And(/^I click on "([^"]*)" button$/) do |button|
  click_button button
end

Given(/^I am signed in$/) do
  login
end

Given(/^a user "([^"]*)" is signed in$/) do |user|
  log_in user
end

Then(/^I should be on the sign up page$/) do
  assert_selector 'h1.title', text: 'Sign up'
  assert_selector '.user-authentication-form'
  assert_selector '.home-link', text: 'Home'
  assert_selector '.sign-in-link', text: 'Sign in'
end

Then(/^I should be on the sign in page$/) do
  assert_selector 'h1.title', text: 'Sign in'
  assert_selector '.user-authentication-form'
  assert_selector '.sign-up-link', text: 'Sign up'
  assert_selector '.forgot-password-link', text: 'Forgot password?'
  assert_selector '.home-link', text: 'Home'
end
