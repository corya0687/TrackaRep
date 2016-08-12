class Run < ActiveRecord::Base
  has_many :timers
  belongs_to :exercise
  has_many :drills

  def run_exercise(timer)

  end
end
