class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  # protect_from_forgery with: :exception
  before_action :authenticate_user!


  before_action :toggle_locale

  layout :layout_by_resource

  def toggle_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

  protected

  def layout_by_resource
    if devise_controller? && resource_name == :user && controller_name == "registrations" || controller_name == "sessions"
      "sign_up.html.erb"
    elsif
      "application"
    end
  end
end
