class WorkoutMuscleGroup < ActiveRecord::Base
  belongs_to :workout
  belongs_to :muscle_group
end
