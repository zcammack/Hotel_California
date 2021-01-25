class SessionsController < ApplicationController

    def home

    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def create
        user = User.find_by(name: params[:user][:name])
        
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid Login Information, please try again."
            redirect_to "/login"
        end
    end
end
