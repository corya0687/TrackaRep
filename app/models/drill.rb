class Drill < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :run

  attr_accessor :target_muscle_ids

  def set_exercise(name)
    exercise = Exercise.find_or_create_by(name)
    self.exercise = exercise
  end

end
