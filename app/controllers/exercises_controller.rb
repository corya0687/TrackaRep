class ExercisesController < ApplicationController
  before_filter :set_exercise, :except => [:index, :new, :create]
  def index

  end

  def new
    @exercise = Exercise.new
  end

  def create
    binding.pry
    @exercise = Exercise.new(exercise_params)
  end

  def edit

  end

  def show

  end

  def destroy

  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :reps, :author_id, :rest_period, :equipment_needed, target_muscle_ids: [])
  end
end
