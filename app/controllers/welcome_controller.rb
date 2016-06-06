class WelcomeController < ApplicationController
  def index
    @exercises = Exercise.all
    @workouts = Workout.all
    @plans = Plan.all
  end
end
