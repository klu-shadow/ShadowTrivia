class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        if session[:session_token] 
            @current_user ||= User.find_by(session_token: session[:session_token])
        else
            Guest.instance
        end
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
