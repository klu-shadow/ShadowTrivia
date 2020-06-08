class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= session[:session_token] ? 
      User.find_by(session_token: session[:session_token]) : Guest.instance
  end

  def logged_in? 
    current_user.logged_in?
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    @current_user.reset_session_token!
    session[:session_token] = nil
  end
end
