Given 'a place called {string}' do |name|
  @place = create :place, name: name, address: 'address', user: create(:user)
end

Given 'user {string} is logged in' do |user|
  log_in user
end

When 'user submits a review with content {string} for that place' do |content|
  click_link 'More Details'
  click_link 'Write a traveller review'

  fill_in 'review[content]', with: content
  click_button 'Submit review'
end

When 'user goes to the page of {string}' do |place_name|
  visit '/'
  click_link 'More Details'
end

And 'tries to write a review' do
  click_link 'Write a traveller review'
end

Then 'user is redirected to the log in page' do
  assert_selector 'h1.title', text: 'Sign in'
end
