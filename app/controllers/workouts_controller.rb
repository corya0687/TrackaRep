class WorkoutsController < ApplicationController
  before_filter :set_workout, :except => [:index, :new, :create]
  def index
    @workouts = Workout.all
  end

  def show
    @comment = Comment.new
    @comments = @workout.comments
  end

  def new
    @workout = Workout.new
  end

  def create
    # binding.pryW
    @workout = Workout.new(workout_params)
    if @workout.valid?
      @workout.save
      redirect_to workout_path(@workout)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @workout.valid?
      @workout.update(workout_params)
      redirect_to workout_path(@workout)
    else
      render "edit"
    end
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
