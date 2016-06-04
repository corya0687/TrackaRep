class Workout < ActiveRecord::Base
  has_many :workout_exercises
  has_many :exercises, :through => :workout_exercises
  has_many :workout_plans
  has_many :plans, :through => :workout_plans
  has_many :workout_muscle_groups
  has_many :muscle_groups, :through => :workout_muscle_groups

end
