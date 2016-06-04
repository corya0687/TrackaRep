class TargetMuscle < ActiveRecord::Base
  has_many :exercise_target_muscles
  has_many :exercises, :through => :exercise_target_muscles
end
