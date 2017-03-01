class FrameworksController < ApplicationController
    def create 
        @language = Language.find(params[:language_id])
        @framework = @language.frameworks.create(framework_params)
        redirect_to language_path(@language)
    end
    
    private
        def framework_params
            params.require(:framework).permit(:name,:description,:category,:year)
        end
end
