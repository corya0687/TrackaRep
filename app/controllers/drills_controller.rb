class DrillsController < ApplicationController
  def index

  end

  def create
    @run = Run.find(params[:run_id])

    @drill = @run.drills.build(drill_params)
    if @drill.valid?
      @run.save
      redirect_to drill_path(@drill)
    end
  end

  def show
    @drill = Drill.find(params[:id])
    render json: @drill
  end

  def edit

  end

  def update

  end

  private

  def drill_params
    params.require(:drill).permit(:set_number, :weight, :reps, :rest_period, :exercise_name)
  end
end
