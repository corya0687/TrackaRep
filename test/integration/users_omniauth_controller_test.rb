require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionController::TestCase
  context 'signup' do
    OmniAuth.config.test_mode = true

    should 'allow signup with facebook credentials' do
      name = Faker::Name.name
      email = Faker::Internet.email
      facebook_omniauth_init( name, email)
      visit new_user_registration_path
      click_on 'Sign in with Facebook'

      page.must_have_content(name)
    end
  end
end
