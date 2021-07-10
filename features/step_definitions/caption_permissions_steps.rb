Given("place {string} with a photo") do |place|
  create_place_with_picture_from place
end

Given(/^visitor is on the photo page$/) do
  visit image_path @picture
end

Then(/^visitor should not see the Edit link$/) do
  assert_no_selector 'a.edit-photo-link', text: 'Edit'
end

And("user is on the photo page that is not hers") do
  visit image_path @picture
  assert_no_selector 'a.edit-photo-link', text: 'Edit'
end

Then("user {string} should not see the Edit link") do |user|
  assert_no_selector 'a.edit-photo-link', text: 'Edit'
end
