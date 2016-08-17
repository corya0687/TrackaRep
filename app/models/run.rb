class Run < ActiveRecord::Base
  has_many :timers
  belongs_to :exercise
  belongs_to :user
  has_many :drills

  def run_exercise(timer)

  end
end
