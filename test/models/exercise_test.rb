require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  should 'create an exercise' do
    create(:exercise)
    assert Exercise.count == 1
  end

  # should 'not create invalid exercise' do
  #   exercise = build(:exercise)
  #   exercise.description = ''
  #   exercise.save
  #   assert Exercise.count == 0
  # end
end
