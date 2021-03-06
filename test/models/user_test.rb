require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = build :user

    assert user.valid?
  end

  test 'invalid without first_name' do
    user = build :user, first_name: nil

    refute user.valid?
  end

  test 'invalid without last_name' do
    user = build :user, last_name: nil

    refute user.valid?
  end

  test 'invalid without email' do
    user = build :user, email: nil

    refute user.valid?
  end

  test 'invalid without password' do
    user = build :user, password: nil

    refute user.valid?
  end

  test '#name' do
    user = build :user, first_name: 'Juan', last_name: 'Carlos'

    assert_equal user.name, 'Juan Carlos'
  end
end
