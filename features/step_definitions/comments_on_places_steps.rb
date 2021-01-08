And("place {string} exists with a photo") do |place|
  create_place_with_photo_from place
end

Given("user is on the image page") do
  visit image_path @photo
end

When("user posts a comment {string} on the picture") do |content|
  post_comment content
end

Then("user will see that comment below the picture") do
  assert_selector '.comment-content', text: 'Where is this?'
end

And("image has a comment {string}") do |content|
  image_has_comment content
end

When("user replaces comment {string} with {string}") do |comment, content|
  replace_comment_with content
end

Then('user will see updated comment {string}') do |comment|
  assert_selector '.comment-content', text: comment
end
