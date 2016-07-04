class SessionsController < ApplicationController
  def create
      user = User.find_or_create_by(:id => auth['uid']) do |u|
        u.username = auth['info']['name']
        u.email = auth['info']['email']
      end
      session[:user_id] = user.id
      redirect_to root_path
    end

    def auth
      request.env['omniauth.auth']
    end
end
