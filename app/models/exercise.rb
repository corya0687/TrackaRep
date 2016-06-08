class Exercise < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :workouts
  has_many :exercise_target_muscles
  has_many :target_muscles, :through => :exercise_target_muscles

  def percentage_to_max
      "#{coefficents[self.reps]}%"
  end

  def coefficents
    {1=>100, 2=>95, 3=>93, 4=>90, 5=>87, 6=>85, 7=>83, 8=>80, 9=>77, 10=>75, 11=>72, 12=>70 }
  end
end
