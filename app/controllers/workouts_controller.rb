class WorkoutsController < ApplicationController
  before_filter :set_workout, :except => [:index, :new, :create]
  def index

  end

  def show
  end

  def new
    @workout = Workout.new
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.save
    redirect_to workout_path(@workout)
  end

  def edit

  end

  def update
    @workout.update(workout_params)
    redirect_to workout_path(@workout)
  end

  def destroy
    @workout.delete
    redirect_to root_path
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

  def workout_params
    params.require(:workout).permit(:name, :description, :exercise_ids, :author_id, :muscle_group_ids => [], :exercise_ids => [], exercise_attributes: [:name])
  end
end
