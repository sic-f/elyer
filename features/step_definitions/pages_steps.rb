Given(/^I am on the home page and places were already submitted$/) do
  create :place
  visit '/'
end

Then(/^I should see the navigation bar$/) do
  assert_selector 'nav.navbar > .navbar-brand'
end

Then(/^I should see the side navigation menu$/) do
  assert_selector 'aside.menu', text: 'Home'
end

Then(/^I should see no places posted yet$/) do
  assert_selector '.notification', text: 'There are no places yet.'
end

Then(/^I should see places posted$/) do
  assert_selector '.title', text: 'Sabang Beach'
end

