class FrameworksController < ApplicationController
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
    def destroy
        @language = Language.find(params[:language_id])
        @framework = @language.frameworks.find(params[:id])
        @framework.destroy
        redirect_to language_path(@language)
    end
    
    private
        def framework_params
            params.require(:framework).permit(:name,:description,:category,:year)
        end
end
