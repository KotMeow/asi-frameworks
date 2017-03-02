class FrameworksController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_filter :authorize_admin, only: [:destroy, :edit, :update]
    
    
    def new
        @framework = Framework.new
    end
    def create 
        @language = Language.find(params[:language_id])
        @framework = @language.frameworks.create(framework_params)
        if @framework.errors.any?
            render 'languages/show' 
        else
            redirect_to language_path(@language)
        end
    end
    def edit
        @language = Language.find(params[:language_id])
        @framework = @language.frameworks.find(params[:id])
    end
    def update
        @language = Language.find(params[:language_id])
        @framework = @language.frameworks.find(params[:id])
        if @framework.update(framework_params)
            redirect_to language_path(@language)
        else
            render 'edit'
        end
    end
    def destroy
        @language = Language.find(params[:language_id])
        @framework = @language.frameworks.find(params[:id])
        @framework.destroy
        redirect_to language_path(@language)
    end
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    def authorize_admin
        redirect_to root_url, status: 401 unless current_user.admin
    #redirects to previous page
    end
    private
        def framework_params
            params.require(:framework).permit(:name,:description,:category,:year, :url)
        end
end
