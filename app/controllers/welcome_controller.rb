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
    # use your code here, not mine
    render text: "fR0nrXUPJP0O8Zu43G2fhQ7TQVxLxxOTYiSgVpK-ano.kkTmr4MRCRll9jWpvJxkZYdzyAzwuTmHPKX6S3a3WiU"
  end
end
