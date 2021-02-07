module SignInHelper
  # For System Tests
  def sign_in
    @user = create :user
    visit root_path as: @user
  end

  def sign_in_as(user)
    visit root_path as: user
  end

  module IntegrationTests
    def sign_in
      @user = create :user
      get root_path as: @user
    end

    def sign_in_as(user)
      get root_path as: user
    end
  end
end
