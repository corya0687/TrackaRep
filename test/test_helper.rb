ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'mocha/mini_test'
require 'mocha/integration/test_unit'
require 'factory_girl_rails'
require 'capybara/rails'
require "minitest/rails/capybara"
require 'capybara/minitest'
require 'faker'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  Devise::Test::IntegrationHelpers
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  include FactoryGirl::Syntax::Methods
  Devise::Test::IntegrationHelpers

  def facebook_omniauth_init( name, email )
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
      'provider' => 'facebook',
      'uid' => '123234345456567',
      'info' => {'email' => email, 'name' => name}
    })

    request.env['omniauth.env'] = OmniAuth.config.mock_auth[:facebook]
  end

end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions
  include FactoryGirl::Syntax::Methods
  Devise::Test::IntegrationHelpers

  # Reset sessions and driver between tests
  # Use super wherever this method is redefined in your individual test classes
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end

end
