require 'rails_helper'
require 'support/pages/registration'

feature 'Account creation', type: :system do
  given(:registration) { Pages::Registration.new }

  context 'with valid details' do
    scenario 'renders success message' do
      expect { registration.submit_valid_details }.to change(User, :count).by 1
      expect(registration).to have_success_message
    end
  end

  context 'with no email' do
    scenario 'renders no email warning' do
      expect { registration.submit_with_no_email }.to_not change(User, :count)
      expect(registration).to have_blank_email_warning
      expect(registration).to have_no_success_message
    end
  end

  context 'with no first name' do
    scenario 'renders no first name warning' do
      expect { registration.submit_with_no_first_name }.to_not change(User, :count)
      expect(registration).to have_blank_first_name_warning
      expect(registration).to have_no_success_message
    end
  end

  context 'with no last name' do
    scenario 'renders no last name warning' do
      expect { registration.submit_with_no_last_name }.to_not change(User, :count)
      expect(registration).to have_blank_last_name_warning
      expect(registration).to have_no_success_message
    end
  end

  context 'with no password' do
    scenario 'renders no password warning' do
      expect { registration.submit_with_no_password }.to_not change(User, :count)
      expect(registration).to have_blank_password_warning
      expect(registration).to have_no_success_message
    end
  end
end
