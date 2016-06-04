class WorkoutExercise < ActiveRecord::Base
  belongs_to :exercise_id
  belongs_to :workout_id
end
