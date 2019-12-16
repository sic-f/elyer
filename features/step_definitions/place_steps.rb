Then(/^I should be on the place submission page$/) do
  assert_selector 'form#new_place', count: 1
end

Then(/^I should not see the "Add" link to submit a place$/) do
  assert_no_selector '.navbar-item.new-place-link', count: 1
end

# Create
# valid fields
Then(/^I fill in the required fields to submit a place$/) do
  fill_in 'place[name]', with: 'Sabang Beach'
  fill_in 'place[description]', with: 'Surf beach'
  fill_in 'place[address]', with: 'Baler, Aurora'
  fill_in 'place[mobile]', with: '09954636990'
  fill_in 'place[landline]', with: '(02) 952-5463'
  fill_in 'place[email]', with: 'sabang@example.com'
  attach_file 'place[main_photo]', image_upload_file, visible: false
  attach_file 'place[images][]', image_upload_file, visible: false
end

Then(/^I should be on the place page$/) do
  assert_selector 'div.notification.is-success', text: 'Successfully submitted place!'
  assert_selector 'h1.title', text: 'Sabang Beach'
end

# invalid fields
When(/^I fill in the required fields with blank values$/) do
  fill_in 'place[name]', with: ''
  fill_in 'place[description]', with: 'Surf beach'
  fill_in 'place[address]', with: ''
  fill_in 'place[mobile]', with: '09954636990'
  fill_in 'place[landline]', with: '(02) 952-5463'
  fill_in 'place[email]', with: 'sabang@example.com'
  attach_file 'place[main_photo]', image_upload_file, visible: false
  attach_file 'place[images][]', image_upload_file, visible: false
end

Then(/^I should still be on the page submission page with error messages$/) do
  assert_selector 'div.notification.is-danger', text: 'Unable to submit place.'
  assert_selector 'p.help.is-danger', text: 'A name is needed.'
  assert_selector 'p.help.is-danger', text: 'You need to provide an address or location.'
end


# Update
# valid fields
Given(/^I am signed in and I try to edit a place that has been submitted$/) do
  user  = create :user
  place = create :place, user: user

  sign_in_as user

  visit "/places/#{place.to_param}/edit"
end

When(/^I fill in the name field for that place$/) do
  fill_in 'place[name]', with: 'Aliya Surf Resort'
end

Then(/^I should be on the place page with an update success message$/) do
  assert_selector 'h1.title', text: 'Aliya Surf Resort'
  assert_selector 'div.notification.is-success', text: 'Update success!'
end

# invalid fields
When(/^I leave the name and address fields blank for that place$/) do
  fill_in 'place[name]', with: ''
  fill_in 'place[address]', with: ''
end

Then(/^I should still be on the place edit page with error messages for name and address$/) do
  assert_selector 'div.notification.is-danger', text: 'Unable to update place.'
  assert_selector 'p.help.is-danger', text: 'A name is needed.'
  assert_selector 'p.help.is-danger', text: 'You need to provide an address or location.'
end

# Deleting a place
Given(/^I am signed in and I go to a place's page$/) do
  user  = create :user
  place = create :place, user: user

  sign_in_as user

  visit "/places/#{place.to_param}"
end

When(/^I click on the delete "trash can" button$/) do
  accept_alert do
    find('i.fas.fa-trash').click
  end
end

Then(/^I should be redirected to the home page with a successful delete message$/) do
  assert_selector 'div.notification.is-success', text: 'Place deleted successfuly.'
  assert_selector '.notification.is-info', text: 'There are no places yet.'
end
