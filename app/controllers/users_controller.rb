class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def edit
        @user = User.find(params[:id])
    end
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:success] = "Welcome! Your account has been registered!"
            redirect_to languages_path 
        else
            render 'new'
        end
    end
    
    def update
        if @user == current_user
            @user = User.find(params[:id])
            if @user.update_attributes(user_params)
                flash[:success] = "Profile updated"
                redirect_to languages_path
            else
                render 'edit'
            end
        end
    end
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
