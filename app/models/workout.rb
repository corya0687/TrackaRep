class Workout < ActiveRecord::Base
  has_many :workout_exercises
  has_many :exercises, :through => :workout_exercises
  has_many :workout_plans
  has_many :plans, :through => :workout_plans
  has_many :workout_muscle_groups
  has_many :muscle_groups, :through => :workout_muscle_groups
  belongs_to :author, :class_name => 'User'

  accepts_nested_attributes_for :exercises,  reject_if: proc { |attributes| attributes['name'].blank? }

  def exercise_attributes=(attributes)
    names= attributes[:name].split(", ")
    names.each do |exercise_name|
      if Exercise.exists?(name: exercise_name)
        exercise = Exercise.find_by(name: exercise_name)
      else
        exercise = Exercise.create(name: exercise_name, author_id: self.author.id)
      end
    self.exercises << exercise
    end
  end


end
