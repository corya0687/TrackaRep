class WorkoutsController < ApplicationController
  before_filter :set_workout, :except => [:index, :new, :create]
  def index
    @upper_body = MuscleGroup.find_by(name: "UpperBody").workouts
    @core_body = MuscleGroup.find_by(name: "Core").workouts
    @lower_body = MuscleGroup.find_by(name: "LowerBody").workouts
    @user_workouts = [Workout.find_by(author_id: current_user.id)]
    @workouts = Workout.all
  end

  def show
    # @comment = Comment.new
    # @comments = @workout.comments
    respond_to do |format|
      format.json { render json: @workout }
    end
  end

  def new
    @workout = Workout.new
    @exercise_pages = Exercise.paginate(page: params[:page], per_page: 8)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @workout = Workout.new(workout_params)
    if @workout.valid?
      @workout.save
      redirect_to workout_path(@workout)
    else
      @exercise_pages = Exercise.paginate(page: params[:page], per_page: 8)

      render 'new'
    end
  end

  def edit
    @exercise_pages = Exercise.paginate(page: params[:page], per_page: 8)

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
    params.require(:workout).permit(:name, :description, :exercise_ids, :author_id, :muscle_group_ids => [], :exercise_ids => [], exercises_attributes: [:name, :sets, :weight, :reps, :rest_period, :author_id])
  end
end
