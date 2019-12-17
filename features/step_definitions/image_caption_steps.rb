When(/^user is viewing an image$/) do
  visit image_path @image
end

Given(/^user "([^"]*)" is signed in and is on the home page and has submitted a place called "([^"]*)" with an image$/) do |user, place|
  log_in_and_create_place name: user, place: place
  visit_home_page
end

Then(/^user should be brought to another page that displays all the pictures uploaded and be able to put captions on them$/) do
  assert_current_path place_path @place
end

And(/^user fills in the description box$/) do
  fill_in '.column > .add-place-description', with: 'Add description'
end
