class ApplicationController < ActionController::Base

    def log_in(user)
        session[:user_id] = user.id
    end
    
    def current_user
        if session[:user_id]    
        @current_user ||= User.find_by(id: session[:user_id])
        pp @current_user
        pp User.find_by(id: session[:user_id])
        end
    end





end
