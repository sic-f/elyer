# authorized
Given(/^I have submitted a place and I am signed in$/) do
  @user  = create :user
  @place = create :place, user: @user
  sign_in_as @user
end

Then(/^I should see the "EDIT" link on a place card$/) do
  assert_selector '.edit-place-link', text: 'EDIT'
end

When(/^I go to the place show page$/) do
  visit place_path @place
end

Then(/^I should see the trash can link on a place card$/) do
  assert_selector '.trash-can-link'
end

# not authorized
Given(/^there is a place I have not created and I am signed in$/) do
  user   = create :user
  @place = create :place

  sign_in_as user
end

Then(/^I should not see the "EDIT" link on a place card$/) do
  assert_no_selector '.edit-place-link', text: 'EDIT'
end

Then(/^I should not see the trash can link on a place card$/) do
  assert_no_selector '.trash-can-link'
end
