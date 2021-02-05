require 'rails_helper'
require 'support/pages/login'

feature 'Authentication' do
  given(:user)  { create :user }
  given(:login) { Pages::Login.new(user) }

  scenario 'successful login' do
    expect(login.with_valid_credentials).to be_successful
  end

  scenario 'unsuccessful login' do
    expect(login.with_invalid_credentials).to_not be_successful
  end

  it 'logout' do
    login.login_user
    expect(login.logout_user).to be_signed_out
  end

  context 'when logged out' do
    it "account and user's contributions links not visible when not signed in" do
      visit '/'

      expect(page).to_not have_selector '.navbar-item.account-link', text: 'Account'
      expect(page).to_not have_selector '.navbar-item.user-contributions-link',
        text: 'Your Contributions'
    end

    it "profile and user's contributions sidebar links are not visible" do
    visit '/'

    expect(page).to_not have_selector '.menu-item.profile-link', text: 'Account'
    expect(page).to_not have_selector '.menu-item.user-contributions-link',
      text: 'Your Contributions'
    end
  end
end
