class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(name: params[:session][:name].downcase, password: params[:session][:password])
    if user
      log_in user
      redirect_to languages_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out
    flash.now[:danger] = 'Log out successfully'
    redirect_to root_url
  end
end
