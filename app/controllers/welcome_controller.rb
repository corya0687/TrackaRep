class WelcomeController < ApplicationController
  def index
    @exercises = Exercise.paginate(page: params[:page], per_page: 4)
    @workouts = Workout.paginate(page: params[:page], per_page: 4)
    @plans = Plan.all
  end


end
