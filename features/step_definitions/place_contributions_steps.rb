Then(/^I will be redirected to the index page of places created by a user$/) do
  assert_selector 'h1.title', text: 'Your Contributions'
end

When(/^I click on Your Contributions link$/) do
  find('.navbar-item.user-contributions-link').click
end
