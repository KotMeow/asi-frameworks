class LanguagesController < ApplicationController
    before_action :logged_in_user, only: [:create]
    before_filter :authorize_admin, only: [:destroy, :edit, :update]
    def index
        @languages = Language.all
    end
    
    def show
        @language = Language.find(params[:id])
    end
    
    def new
        @language = Language.new
    end
    
    def edit
        @language = Language.find(params[:id])
    end
    
    def create
        @language = Language.new(language_params)
        if @language.save
            redirect_to @language
        else
            render 'new'
        end
    end
    
    def update
        @language = Language.find(params[:id])
 
        if @language.update(language_params)
            redirect_to @language
        else
            render 'edit'
        end
    end
    
    def destroy
        @language = Language.find(params[:id])
        @language.destroy
 
        redirect_to languages_path
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
        def language_params
            params.require(:language).permit(:name, :description)
        end
end
