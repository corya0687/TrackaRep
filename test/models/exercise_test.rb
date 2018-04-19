require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  should 'create an exercise' do
    create(:exercise)
    assert Exercise.count == 1
  end

  should 'be invalid with a name' do
  
  end

  should 'be invalid with a name less then 2 characters' do

  end

  should 'be invalid with a name more than 25 characters' do

  end

  should 'be invalid without description' do

  end

  should 'be invalid with description less than 8 characters' do

  end

  should 'be invalid with a description more than 100 characters' do

  end

  should 'be invalid if reps are not a number or nil' do

  end

  should 'be invalid if rest_period is not a number or nil' do

  end

  should 'be invalid if sets is not a number or nil' do

  end
  #validates :name, presence: true, length: { minimum: 2, maximum: 60 }
  #validates :description, presence: true, length: { minimum: 8, maximum: 100 } unless :description.nil?
  #validates :reps, numericality: { only_integer: true } unless :reps.nil?
  #validates :rest_period, numericality: { only_integer: true }
  #validates :sets, numericality: { only_integer: true }
end
