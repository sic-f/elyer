module Pages
  class Login
    include Rails.application.routes.url_helpers
    include Capybara::DSL

    def initialize(user)
      @user = user
    end

    def with_valid_credentials
      visit '/login'

      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: user.password

      click_button 'Sign in'

      self
    end

    def with_invalid_credentials
      visit '/login'

      fill_in 'session[email]', with: user.email
      fill_in 'session[password]', with: 'wrong_password'

      click_button 'Sign in'

      self
    end

    def successful?
      has_add_place_link? && has_sign_out_link? && has_no_sign_in_link? &&
        !has_wrong_credentials_message?
    end

    def login_user
      visit root_path as: user
    end

    def logout_user
      click_link 'Sign out'

      self
    end

    def signed_out?
      has_home_link? && !has_add_place_link? && !has_sign_out_link?
    end

    private
      attr_reader :user

      def has_add_place_link?
        has_selector? '.navbar-item.new-place-link'
      end

      def has_sign_out_link?
        has_selector? '.navbar-item.sign-out-link'
      end

      def has_no_sign_in_link?
        !has_selector? '.navbar-item.sign-in-link'
      end

      def has_wrong_credentials_message?
        has_selector? 'div.notification.is-danger', text: 'Bad email or password.'
      end

      def has_home_link?
        has_selector? '.home-link'
      end
  end
end
