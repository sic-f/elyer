first_name = FFaker::NamePH.first_name_female
last_name  = FFaker::NamePH.last_name

# Successful Account Creation
And(/^I fill in the required fields for creating an account$/) do
  fill_in 'user[first_name]', with: first_name
  fill_in 'user[last_name]', with: last_name
  fill_in 'user[email]', with: FFaker::Internet.safe_email
  fill_in 'user[password]', with: FFaker::Internet.password
end

Then(/^I should be redirected to the home page and see the welcome flash message$/) do
  assert_current_path '/'
  assert_selector 'div.notification.is-success',
    text: "Welcome #{first_name} #{last_name}!"
end

### Unsuccessful
# without email
And(/^I fill in the required fields except email$/) do
  fill_in 'user[first_name]', with: first_name
  fill_in 'user[last_name]', with: last_name
  fill_in 'user[email]', with: nil
  fill_in 'user[password]', with: FFaker::Internet.password
end

Then(/I should see an error message indicating an invalid email$/) do
  assert_selector '.help.user-email', text: 'is invalid'
  assert_no_selector 'div.notification.is-success',
                  text: "Welcome #{first_name} #{last_name}!"
end

And(/^I should still be in the sign up page$/) do
  assert_no_current_path '/'
  assert_current_path '/users' # after a post to create a user, url changes from /signup to /users
end

# without first name
And(/^I fill in the required fields except first name$/) do
  fill_in 'user[first_name]', with: nil
  fill_in 'user[last_name]', with: last_name
  fill_in 'user[email]', with: FFaker::Internet.safe_email
  fill_in 'user[password]', with: FFaker::Internet.password
end

Then(/I should see an error message indicating a blank first name$/) do
  assert_selector '.help.user-first-name', text: "can't be blank"
  assert_no_selector 'div.notification.is-success',
                  text: "Welcome #{first_name} #{last_name}!"
end

# without last name
And(/^I fill in the required fields except last name$/) do
  fill_in 'user[first_name]', with: first_name 
  fill_in 'user[last_name]', with: nil
  fill_in 'user[email]', with: FFaker::Internet.safe_email
  fill_in 'user[password]', with: FFaker::Internet.password
end

Then(/I should see an error message indicating a blank last name$/) do
  assert_selector '.help.user-last-name', text: "can't be blank"
  assert_no_selector 'div.notification.is-success',
                  text: "Welcome #{first_name} #{last_name}!"
end

# without password
And(/^I fill in the required fields except password$/) do
  fill_in 'user[first_name]', with: first_name 
  fill_in 'user[last_name]', with: last_name
  fill_in 'user[email]', with: FFaker::Internet.safe_email
  fill_in 'user[password]', with: nil
end

Then(/I should see an error message indicating a blank password$/) do
  assert_selector '.help.user-password', text: "can't be blank"
  assert_no_selector 'div.notification.is-success',
                  text: "Welcome #{first_name} #{last_name}!"
end
