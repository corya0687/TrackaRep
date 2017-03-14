class RunsController < ApplicationController
  before_action :set_run, only: [:show, :update, :edit, :destroy]

  def run
    @exercise = Exercise.find(params[:exercise_id])
  end

  def index
    @runs = current_user.runs
    @last_five_runs = Run.order(created_at: :desc).limit(5)
    respond_to do |format|
      format.html
      format.json { render json: @last_five_runs }
    end
  end

  def new
    params[:workout_id] ? @workout = Workout.find(params[:workout_id]) : @workout = Workout.new(one_off: true)
    @run = @workout.runs.build
    @exercise = @workout.set_exercise(params[:exercise_id])
    @drill = @run.drills.build
  end

  def edit

  end

  def create
    @run = Run.new(run_params)
    binding.pry
    @run.user_id = current_user.id
    if @run.valid?
      @run.save
      respond_to do |format|
        format.html {redirect_to user_run_path(@run.user, @run)}
        format.json { render json: @run }
      end
    else
      flash[:notice] = 'Run Not saved'
      redirect_to root_path
    end
  end

  def update
    @run.update_attributes(run_params)
    redirect_to user_run_path(current_user, @run);
  end

  def show
    respond_to do |format|
      format.html
      format.json {render json: @run}
    end
  end

  def destroy
    @run.destroy
    redirect_to root_path
  end

  private

  def set_run
    @run = Run.find(params[:id])
  end

  def run_params
    params.require(:run).permit( :duration, :oneoff_name, drills_attributes: [:set_number, :id, :weight, :reps, :rest_period, :exercise_name, :target_muscle_ids => []] )
  end

end
