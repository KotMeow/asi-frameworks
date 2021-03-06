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
        @user = User.find(params[:id])
        if User.find(session[:user_id]).id == @user.id
            if @user.update_attributes(user_params)
                flash[:success] = "Profile updated"
                redirect_to languages_path
            else
                render 'edit'
            end
        else
            flash[:danger] = "Nice try. -.-"
            redirect_to edit_user_path(@user)
        end
    end
    
    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
