class PropertiesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update]

    def index 
        properties = Property.all 
        render json: properties, include: [:user]
    end

    def create 
        @new = Property.create(property_params)
        puts @new
    end

    def show
        property = Property.find(params[:id])
       if property
          render json: 
            { property: property }
          
        else
          render json: {
            status: 500,
            errors: ['user not found']
          }
        end
      end

    def update
        property = Property.find(params[:id])
        property.update(property_params)
      end

      def property_params
        params.require(:property).permit(:user_id, :address, :rent, :bedrooms, :bathrooms, :sqft, :availability, :available_date, :description, :longitude, :latitude)
    end


end
