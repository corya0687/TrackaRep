class Exercise < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :workouts
  has_many :exercise_target_muscles
  has_many :muscle_groups, :through => :exercise_target_muscles
end
