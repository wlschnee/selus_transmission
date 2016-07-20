class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user, :authenticated_only, :unauthenticated_only

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def unauthenticated_only
    redirect_to dashboard_path, notice: "You're already logged in" if logged_in?
  end

  def authenticated_only
    redirect_to login_path, notice: "You must be logged in to do that" if !logged_in?
  end
end
