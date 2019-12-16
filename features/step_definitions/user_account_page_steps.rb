Then(/^user "([^"]*)" should be redirected to the account page$/) do |user|
  first_name = user.split.first
  last_name  = user.split.last
  full_name  = "#{first_name} #{last_name}"

  assert_selector 'h1.title', text: full_name
end
