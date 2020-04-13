class ApplicationsController < ApplicationController    
    skip_before_action :authorized, only: [:create, :index, :show, :update, :destroy, :landlord_applications, :tenant_applications]
    

    def create
        @application = Application.create(application_params)
        render json: {application: @application}
    end 


    def index
        applications = Application.all
        render json: applications, include: [:landlord, :tenant, :property]
    end 

    def show
        application = Application.find(params[:id])
       if application
        render json: {
            application: application
          } 
          
        else
          render json: {
            status: 500,
            errors: ['user not found']
          }
        end
      end

      def update
        application = Application.find(params[:id])
        application.update(application_params)
      end

    

    def destroy
        Application.destroy(params[:id])
      end

      def landlord_applications
        user = User.find(params[:id])
        applications = Application.all.select{|application| application.landlord_id == user.id} 
        render json: applications, include: [:landlord, :tenant, :property]
      end 

      def tenant_applications
        user = User.find(params[:id])
        applications = Application.all.select{|application| application.tenant_id == user.id} 
        render json: applications, include: [:landlord, :tenant, :property]
      end 

    private
    
    def application_params
        params.require(:application).permit(:landlord_id, :tenant_id, :property_id, :description, :status)
    end 
end
