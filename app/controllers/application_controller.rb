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
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def ensure_not_logged_in
    redirect_to categories_url if logged_in? 
  end

  def ensure_logged_in
    unless logged_in?
      flash[:errors] = ['Sorry, you must be logged in to perform this action.']
      redirect_to new_session_url
    end
  end
end
