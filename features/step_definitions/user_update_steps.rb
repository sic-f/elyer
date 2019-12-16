When(/^user fills in required fields to update user details with "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)"$/) do |first_name, last_name, email, password|
  fill_in 'user[first_name]', with: first_name
  fill_in 'user[last_name]', with: last_name
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
end

When(/^user should be redirected to user show page with heading "([^"]*)" and success message$/) do |name|
  first_name = name.split.first
  last_name  = name.split.last
  full_name  = "#{first_name} #{last_name}"

  user = User.find_by first_name: first_name, last_name: last_name

  assert_current_path "/users/#{user.to_param}"
  assert_selector 'h3.title.is-3', text: full_name
  assert_selector 'div.notification.is-success', text: 'Account successfuly updated.'
end

When(/^user leaves required fields blank for updating an account$/) do
  fill_in 'user[first_name]', with: nil
  fill_in 'user[last_name]', with: nil
  fill_in 'user[email]', with: nil
  fill_in 'user[password]', with: nil
end

Then(/^user "([^"]*)" receives error messages and should still be on the edit account page$/) do |name|
  user = User.find_by first_name: name.split.first, last_name: name.split.last

  assert_current_path "/users/#{user.to_param}"
  assert_selector '.help.is-danger.user-first-name', text: "can't be blank"
  assert_selector '.help.is-danger.user-last-name', text: "can't be blank"
  assert_selector '.help.is-danger.user-email', text: 'is invalid'
  assert_selector '.help.is-danger.user-password', text: "can't be blank"
end
