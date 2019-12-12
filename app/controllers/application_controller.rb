class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        # return this user if session user_id is stored backed by browser
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # If have current_user, return true, otherwise, return false
        !!current_user
    end

    def require_user
        # if logged_in? returns false
        if !logged_in?
            flash[:danger] = "You must be logged in to do this"
            redirect_to root_path
        end 
    end

end

