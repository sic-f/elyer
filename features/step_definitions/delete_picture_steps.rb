When(/^user clicks on the delete "trash can" button$/) do
  accept_alert do
    find('.trash-can-link').click
  end
end

Then(/^user should be redirected to the place page with successful delete message$/) do
  assert_selector 'div.notification.is-success', text: 'Picture deleted successfuly.'
end
