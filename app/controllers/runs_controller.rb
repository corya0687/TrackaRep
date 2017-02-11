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
    params[:workout_id] ? @workout = Workout.find(params[:workout_id]) : @workout = Workout.new(one_off: true)
    @run = @workout.runs.build
    @exercise = @workout.set_exercise(params[:exercise_id])
    @run.user_id = current_user.id
    @drill = @run.drills.build
    @run.save
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
