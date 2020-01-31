class PropertiesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index]

    def index 
        properties = Property.all 
        render json: properties, include: [:user]
    end

    def create 
        @new = Property.create(property_params)
        puts @new
    end

    def update
        property = Property.find(params[:id])
        property.update(property_params)
      end

      def property_params
        params.require(:property).permit(:user_id, :address, :rent, :bedrooms, :bathrooms, :sqft, :availability, :available_date, :description, :longitude, :latitude)
    end


end
