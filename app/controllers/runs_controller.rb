class RunsController < ApplicationController
  def run
    @exercise = Exercise.find(params[:exercise_id])

  end

  def new
  end
end
