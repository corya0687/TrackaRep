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

   accepts_nested_attributes_for :exercises, :reject_if => :all_blank, :allow_destroy => true


  def exercise_attributes=(attributes)
    binding.pry
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
    return unless self.exercises.size != 0
    avg = self.exercises.inject(0){|sum,exercise| sum + exercise.rating if !exercise.rating.nil?}
    avg = avg/self.exercises.size unless avg.nil? # && self.exercises.size.nil?
    avg
  end

  def edit_checked?(exercise)
    self.exercises.any? do |we|
      we.id == exercise.id
    end
  end


end
