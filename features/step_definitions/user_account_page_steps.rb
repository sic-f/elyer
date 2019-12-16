Then(/^user "([^"]*)" should be redirected to the account page$/) do |user|
  first_name = user.split.first
  last_name  = user.split.last
  full_name  = "#{first_name} #{last_name}"

  assert_selector 'h3.title.is-3', text: full_name
end

Then(/^user should see fields for editing an account$/) do
  assert_selector 'label[for="user_first_name"]'
  assert_selector 'label[for="user_last_name"]'
  assert_selector 'label[for="user_email"]'
  assert_selector 'label[for="user_password"]'
end
