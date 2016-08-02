class Workout < ActiveRecord::Base
  has_many :workout_exercises
  has_many :exercises, :through => :workout_exercises
  has_many :workout_plans
  has_many :plans, :through => :workout_plans
  has_many :workout_muscle_groups
  has_many :muscle_groups, :through => :workout_muscle_groups
  belongs_to :author, :class_name => 'User'
  has_many :comments
  has_many :users, through: :comments

  validates :name, presence: true, length: { minimum: 2, maximum: 60 }
  validates :description, presence: true, length: { minimum: 8, maximum: 500 }

#  accepts_nested_attributes_for :exercises,  reject_if: proc { #|attributes| attributes['name'].blank? }

  def exercise_attributes=(attributes)
    names= attributes[:name].split(", ")
    names.each do |exercise_name|
      if Exercise.exists?(name: exercise_name)
        exercise = Exercise.find_by(name: exercise_name)
      else
        exercise = Exercise.create(name: exercise_name, author_id: self.author.id)
      end
    self.workout_exercises.build(exercise_id: exercise.id)
    end
  end

  def avg_rating
    return unless self.exercises
    avg = self.exercises.inject(0){|sum,exercise| sum + exercise.rating if !exercise.rating.nil?}
    avg = avg/self.exercises.size unless avg.nil?
    avg
  end

end
