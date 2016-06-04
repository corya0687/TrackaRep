class WorkoutPlan < ActiveRecord::Base
  belongs_to :plan_id
  belongs_to :workout_id
end
