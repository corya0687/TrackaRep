class Workout < ActiveRecord::Base

  attr_accessor :one_off
  has_many :workout_exercises
  has_many :exercises, :through => :workout_exercises
  has_many :workout_plans
  has_many :plans, :through => :workout_plans
  has_many :workout_muscle_groups
  has_many :muscle_groups, :through => :workout_muscle_groups
  belongs_to :author, :class_name => 'User'
  has_many :comments
  has_many :users, through: :comments
  has_many :runs

  validates :name, presence: true, length: { minimum: 2, maximum: 60 }
  validates :description, presence: true, length: { minimum: 8, maximum: 500 }

  accepts_nested_attributes_for :exercises, :reject_if => :all_blank, :allow_destroy => true
  after_initialize :set_one_off


  def one_off?
    self.one_off == true
  end

  def set_one_off
    if self.one_off?
      self.name = 'Untitled'
      self.description = 'One off Untitled Workout'
    end
  end


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

  def set_exercise(exercise_id)
    if exercise_id
      exercise = Exercise.find(exercise_id)
    else
      if self.exercises.count == 0
        exercise = OneOffExercise.new
      else
        exercise = self.exercises.first
      end
    end
    exercise
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
