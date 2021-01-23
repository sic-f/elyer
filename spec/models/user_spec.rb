require 'rails_helper'

RSpec.describe User, type: :model do
  it 'valid user' do
    user = build :user

    expect(user).to be_valid
  end

  it 'invalid without first_name' do
    user = build :user, first_name: nil

    expect(user).to_not be_valid
  end

  it 'invalid without last_name' do
    user = build :user, last_name: nil

    expect(user).to_not be_valid
  end

  it 'invalid without email' do
    user = build :user, email: nil

    expect(user).to_not be_valid
  end

  it 'invalid without password' do
    user = build :user, password: nil

    expect(user).to_not be_valid
  end
end
