if ENV['CIRCLE_ARTIFACTS']
  require 'coveralls'
  Coveralls.wear!('rails')
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'minitest/reporters'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end
