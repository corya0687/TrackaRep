class RunsController < ApplicationController
  def run
    @exercise = Exercise.find(params[:exercise_id])
  end

  def index
    @runs = current_user.runs
    respond_to do |format|
      format.html
      format.json {render json: @runs}
    end
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @run = @exercise.runs.build
    @run.user_id = current_user.id
    @run.save
    @drill = @run.drills.build
  end

  def create

  end

  def update
    @run = Run.find(params[:id])
    binding.pry

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
    params.require(:run).permit(:duration, :drills=> [],  )
  end

end
