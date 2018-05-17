class Exercise < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'

  has_many :workout_exercises
  has_many :workouts, :through => :workout_exercises
  has_many :exercise_target_muscles
  has_many :target_muscles, :through => :exercise_target_muscles
  has_many :runs
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :description, presence: true, length: { minimum: 8, maximum: 100 } if :description.present?
  validates :reps, :is_integer?
  validates :rest_period, :is_integer?
  validates :sets, :is_integer?

  def is_integer?(value)
    return true unless value.present?
    value.class = Integer
  end

  def percentage_to_max
      "#{coefficents[self.reps]}%"
  end

  def coefficents
    {1=>100, 2=>95, 3=>93, 4=>90, 5=>87, 6=>85, 7=>83, 8=>80, 9=>77, 10=>75, 11=>72, 12=>70 }
  end

  def self.most_popular
    order(:rating).last
  end

  def rest_period_mins
    if self.rest_period
      Time.at(self.rest_period).utc.strftime("%M:%S")
    end
  end


end
