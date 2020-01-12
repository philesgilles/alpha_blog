class SessionsController < ApplicationController
    def new
        
    end
    def create
        user = User.find_by(email:params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:success] = "You are logged in"
            redirect_to user_path(user)
        else
            flash.now[:danger] = "Login failed"
            render 'new'
        end
    end
    def destroy
        session[:user_id] = nil
        flash[:warning] = "You are logged out"
        redirect_to login_path
    end
    
    
end