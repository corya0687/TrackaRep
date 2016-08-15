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
end
