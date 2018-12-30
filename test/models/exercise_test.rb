require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  should 'create an exercise' do
    create(:exercise)
    assert Exercise.count == 1
  end

  should 'be invalid without a name' do
    exercise_1 = build(:exercise, {name: nil})
    assert exercise_1.valid? === false
    exercise_1.save
    assert exercise_1.errors.messages[:name].first == "can't be blank"
  end

  should 'be invalid with a name less then 2 characters' do
    exercise_1 = build(:exercise, {name: 'a'})
    assert exercise_1.valid? === false
    exercise_1.save
    assert exercise_1.errors.messages[:name].first == "is too short (minimum is 2 characters)"
  end

  should 'be invalid with a name more than 25 characters' do
    exercise_1 = build(:exercise, {name: 'sdlfkasksfdfasdfasdfasdfadfslkf;lskdf;laks;dlsdfjaksjdflkasjdlfka'})
    assert exercise_1.valid? === false
    exercise_1.save
    assert exercise_1.errors.messages[:name].first == "is too long (maximum is 25 characters)"
  end

  should 'be invalid without description' do
    exercise_1 = build(:exercise, {name:'curls', description:nil})
    assert exercise_1.valid? === false
    exercise_1.save
    assert exercise_1.errors.messages[:description].first == "can't be blank"
  end

  should 'be invalid with description less than 8 characters' do
    exercise_1 = build(:exercise, {name:'curls', description:'happy'})
    assert exercise_1.valid? === false
    exercise_1.save
    assert exercise_1.errors.messages[:description].first == "is too short (minimum is 8 characters)"
  end

  should 'be invalid with a description more than 100 characters' do
    fakeDes = 'a'
    200.times do
      fakeDes+= 'b'
    end
    exercise_1 = build(:exercise, {name:'curls', description:fakeDes})
    exercise_1.save
    assert exercise_1.valid? === false
    assert exercise_1.errors.messages[:description].first == "is too long (maximum is 100 characters)"
  end

  should 'be invalid if reps are not a number or nil' do
    exercise_1 = build(:exercise, { reps:'hotsauce'})
    assert exercise_1.valid? === false
    assert exercise_1.errors.messages[:reps].first == "must be an integer"
  end

  should 'be invalid if rest_period is not a number or nil' do
    exercise_1 = build(:exercise, { rest_period:'hotsauce'})
    assert exercise_1.valid? === false
    assert exercise_1.errors.messages[:rest_period].first == "must be an integer"
  end

  should 'be invalid if sets is not a number or nil' do
    exercise_1 = build(:exercise, { sets:'hotsauce'})
    assert exercise_1.valid? === false
    assert exercise_1.errors.messages[:sets].first == "must be an integer"
  end

end
