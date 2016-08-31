class Run < ActiveRecord::Base
  has_many :timers
  belongs_to :exercise
  belongs_to :user
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
end
