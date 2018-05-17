class ExercisesController < ApplicationController
  before_action :set_exercise, :except => [:index, :new, :create]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    authorize @exercise
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.author_id = params[:user_id]
    if @exercise.valid?
      @exercise.save
      redirect_to exercise_path(@exercise)
    else
      render "new"
    end
  end

  def edit

  end

  def update
    if @exercise.valid?
      @exercise.update(exercise_params)
      redirect_to exercise_path(@exercise)
    else
      render "edit"
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @exercise}
    end
  end

  def destroy
    @exercise.delete
    redirect_to exercises_path
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def set_one_off_workout
    @workout = Workout.new(one_off: true)
    @workout.save
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :sets, :reps, :weight, :author_id, :rating, :rest_period, :equipment_needed, target_muscle_ids: [])
  end

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(new_user_session_path)
  end
end
