class RunsController < ApplicationController
  def run
    @exercise = Exercise.find(params[:exercise_id])
  end

  def new
    @exercise = Exercise.find(params[:exercise_id])
    @run = @exercise.runs.build
    @run.save
    @drill = @run.drills.build
  end

  def create

  end

  def show
    @run = Run.find(params[:id])
    binding.pry
    respond_to do |format|
      format.html
      format.json {render json: @run}
    end
  end
end
