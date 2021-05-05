class SessionsController < ApplicationController

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to '/welcome'
        else
            flash[:notice] = "Login information is incorrect. Please try again."
            redirect_to '/login'
        end 

    end 

end 