class LanguagesController < ApplicationController
    def index
        @languages = Language.all
    end
    
    def show
        @language = Language.find(params[:id])
    end
    
    def new
    end
    
    def create
        @language = Language.new(params[:language].permit(:name, :description))
        @language.save
        redirect_to @language
    end
    
    private
        def language_params
            params.require(:language).permit(:name, :description)
        end
end
