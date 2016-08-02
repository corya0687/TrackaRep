class ExercisesController < ApplicationController
  before_filter :set_exercise, :except => [:index, :new, :create]
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
    authorize @exercise
  end

  def create
    @exercise = current_user.exercises.build(exercise_params)
    binding.pry
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

  end

  def destroy
    @exercise.delete
    redirect_to exercises_path
  end

  private

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end

  def exercise_params
    params.require(:exercise).permit(:name, :description, :sets, :reps, :author_id, :rating, :rest_period, :equipment_needed, target_muscle_ids: [])
  end



  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(new_user_session_path)
  end
end