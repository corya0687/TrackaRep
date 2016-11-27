class WelcomeController < ApplicationController


 before_action :authenticate_user!, :only => [:index]

  def index
    @exercises = Exercise.paginate(page: params[:page], per_page: 3)
    @workouts = Workout.paginate(page: params[:page], per_page: 3)
    @plans = Plan.all
  end

  def home
    if !current_user
      @workouts = Workout.paginate(page: params[:page], per_page: 8)
      render :layout => false
    else
      redirect_to index_path
    end
  end
end
