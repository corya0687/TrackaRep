class Run < ActiveRecord::Base
  has_many :timers
  belongs_to :exercise
  belongs_to :user
  belongs_to :workout
  has_many :drills

  def avg_exercise_weight
    if self.drills > 0
      avg = self.drills.inject(0) do |sum, drill|
         sum + drill.weight if !drill.weight.nil?
       end
        avg = avg/self.drills.size unless avg.nil?
        avg
    end
  end

  def workout_name
    self.workout.name || self.active_workout
  end

end
