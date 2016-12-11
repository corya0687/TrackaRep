class RunsController < ApplicationController
  def run
    @exercise = Exercise.find(params[:exercise_id])
  end

  def index
    @runs = current_user.runs
    respond_to do |format|
      format.html
      format.json { render json: @runs }
    end
  end

  def new
    if params[:workout_id]
      @workout = Workout.find(params[:workout_id])
      @run = @workout.runs.build
      if @workout.exercises.count == 0
        @exercise = @workout.exercises.create(name: "Untitled Exercises", description: "New Exercise")
      else
        @exercise = @workout.exercises.first
      end
    elsif params[:exercise_id]
      @exercise = Exercise.find(params[:exercise_id])
      @run = @exercise.runs.build
      @workout = @exercise.workouts.build(name:"Untitled Workout", description: "One off workout created on the fly")
    end

    @run.user_id = current_user.id
    @run.save
    @drill = @run.drills.build

  end

  def create

  end

  def update
    @run = Run.find(params[:id])
    @run.update(run_params)
    redirect_to user_run_path(current_user, @run);
  end

  def show
    @run = Run.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @run}
    end
  end

  private

  def run_params
    params.require(:run).permit(:duration, :drills=> []  )
  end

end
