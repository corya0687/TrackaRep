require 'test_helper'

class ExerciseRunTest < ActionDispatch::IntegrationTest
  context 'exercise run' do

    setup do
      @exercise = create(:exercise)
      @user = create(:user)
      login_user(@user)
    end

    should 'play button should navigate to run interface' do
      click_on 'Exercises'
      click_on "#{@exercise.name}_run".downcase
      page.must_have_content "#{@exercise.name} Set-1"
    end

    should 'record set' do
      click_on 'Exercises'
      click_on "#{@exercise.name}_run".downcase
      fill_in 'weight-input', with: 150
      fill_in 'rep-input', with: 8
      click_on 'End Set'
    end
  end

end
