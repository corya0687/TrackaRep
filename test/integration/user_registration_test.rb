require 'test_helper'

class UserRegistrationTest < ActionDispatch::IntegrationTest
  context 'user registration' do
    setup do
      visit new_user_registration_path
    end

    should "register with valid input" do
      fill_in "user_email", with: Faker::Internet.email
      password = Faker::Internet.password
      fill_in "user_password", with: password
      fill_in "user_password_confirmation", with: password
      click_on "Sign up"
      assert User.first.present?
    end

    should "fail registration with invalid input" do
      fill_in "user_email", with: Faker::Internet.email
      fill_in "user_password", with: Faker::Internet.password
      fill_in "user_password_confirmation", with: 'asdf'
      click_on "Sign up"
      assert_not User.first.present?
    end
  end
end
