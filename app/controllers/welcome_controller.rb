class WelcomeController < ApplicationController
  def index
    @exercises = Exercise.paginate(page: params[:page], per_page: 3)
    @workouts = Workout.paginate(page: params[:page], per_page: 3)
    @plans = Plan.all
  end


end
