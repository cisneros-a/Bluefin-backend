class ApplicationsController < ApplicationController    
    def index
        applications = Application.all
        render json: applications, include: [:landlord, :tenant, :property]
    end 

    def create
        @new = Application.create(application_params)
        puts @new
    end 

    private
    
    def application_params
        params.require(:application).permit(:landlord_id, :tenant_id, :match_id)
    end 
end
