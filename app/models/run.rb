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

  def workout_attached
   self.workout ? self.workout : Workout.new(name: "One Off")
  end
  #
  # def one_off
  #   self.active_one_off || self.add_to_one_off
  # end
  #
  # # def add_to_one_off
  # #   w = Workout.where(name:"One Off").first.runs << self
  # #   w.save
  # # end

  def active_one_off
    Workout.where(created_at: (Time.now - 3.hours)..Time.now).where(name:"One Off").first
  end


end
