class Exercise < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'

  has_many :workout_exercises
  has_many :workouts, :through => :workout_exercises
  has_many :exercise_target_muscles
  has_many :target_muscles, :through => :exercise_target_muscles
  has_many :runs
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :description, presence: true, length: { minimum: 8, maximum: 100 } if :description.present?
  validate :reps_is_integer?
  validate :sets_is_integer?
  validate :rest_period_is_integer?


  def reps_is_integer?
    errors.add(:reps, "must be an integer") if !is_integer?(reps)
  end

  def sets_is_integer?
    errors.add(:sets, "must be an integer") if !is_integer?(sets)
  end

  def rest_period_is_integer?
    errors.add(:rest_period, "must be an integer") if !is_integer?(rest_period)
  end

  def is_integer?(value)
    return true unless value.present?
    value.class == Integer
  end

  def percentage_to_max
      "#{coefficents[self.reps]}%"
  end

  def coefficents
    {1=>100, 2=>95, 3=>93, 4=>90, 5=>87, 6=>85, 7=>83, 8=>80, 9=>77, 10=>75, 11=>72, 12=>70 }
  end

  def rest_period_mins
    if self.rest_period
      Time.at(self.rest_period).utc.strftime("%M:%S")
    end
  end

end
