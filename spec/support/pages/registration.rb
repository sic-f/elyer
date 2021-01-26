module Pages
  class Registration
    include Rails.application.routes.url_helpers
    include Capybara::DSL

    def visit_login_page
      visit '/signup'
    end

    def submit_valid_details
      visit_login_page

      fill_in 'user[first_name]', with: FFaker::NamePH.first_name_female
      fill_in 'user[last_name]', with: FFaker::NamePH.last_name
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    def submit_with_no_email
      visit_login_page

      fill_in 'user[first_name]', with: FFaker::NamePH.first_name_female
      fill_in 'user[last_name]', with: FFaker::NamePH.last_name
      fill_in 'user[email]', with: nil
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    def submit_with_no_first_name
      visit_login_page

      fill_in 'user[first_name]', with: nil
      fill_in 'user[last_name]', with: FFaker::NamePH.last_name
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    def submit_with_no_last_name
      visit_login_page

      fill_in 'user[first_name]', with: FFaker::NamePH.first_name_female
      fill_in 'user[last_name]', with: nil
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: FFaker::Internet.password

      click_button 'Create Account'
    end

    def submit_with_no_password
      visit_login_page

      fill_in 'user[first_name]', with: FFaker::NamePH.first_name_female
      fill_in 'user[last_name]', with: FFaker::NamePH.last_name
      fill_in 'user[email]', with: FFaker::Internet.safe_email
      fill_in 'user[password]', with: nil

      click_button 'Create Account'
    end

    def no_email_warning?
      has_selector? '.help.user-email', text: 'is invalid'
    end

    def no_first_name_warning?
      has_selector? '.help.user-first-name', text: "can't be blank"
    end

    def no_last_name_warning?
      has_selector? '.help.user-last-name', text: "can't be blank"
    end

    def no_password_warning?
      has_selector? '.help.user-password', text: "can't be blank"
    end

    def success_message?
      has_selector? 'div.notification.is-success'
    end

    private
      attr_reader :first_name, :last_name
  end
end
