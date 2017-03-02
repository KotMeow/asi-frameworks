class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome! Your account has been registered!"
            redirect_to languages_path 
        else
            render 'new'
        end
    end
    
    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
