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

  def letsencrypt
    render plain: "DaZh6rlgd0J4PuPaGRjvZY2Xigb2fEB9v2L-ODX3F40.kkTmr4MRCRll9jWpvJxkZYdzyAzwuTmHPKX6S3a3WiU"
  end
end
