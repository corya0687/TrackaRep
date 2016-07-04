class Exercise < ActiveRecord::Base
  belongs_to :author, :class_name => 'User'
  has_many :workouts
  has_many :exercise_target_muscles
  has_many :target_muscles, :through => :exercise_target_muscles

  validates :name, presence: true, length: { minimum: 2, maximum: 60 }
  #validates :description, presence: true, length: { minimum: 8, maximum: 100 } unless :description.nil?
#  validates :reps, numericality: { only_integer: true } unless :reps.nil?
#  validates :rest_period, numericality: { only_integer: true }
  #validates :sets, numericality: { only_integer: true }

  def percentage_to_max
      "#{coefficents[self.reps]}%"
  end

  def coefficents
    {1=>100, 2=>95, 3=>93, 4=>90, 5=>87, 6=>85, 7=>83, 8=>80, 9=>77, 10=>75, 11=>72, 12=>70 }
  end

  def self.most_popular
    order(:rating).last
  end


end
