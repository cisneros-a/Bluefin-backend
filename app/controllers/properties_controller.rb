class PropertiesController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :update, :update_availability]

    def index 
        properties = Property.all
        properties_with_uploads = properties.map{ |property| { property: property, uploads: rails_blob_path(property.uploads) }}

        render json: properties_with_uploads, include: [:user]
    end

    def create 
        property = Property.create(property_params)
        render json: property.id
    end

    def show
        property = Property.find(params[:id])
        
        uploads = rails_blob_path(property.uploads, disposition: "attachment", only_path: true)
        
       if property
        
          render json: { property: property, uploads: uploads }
             
        else
          render json: {
            status: 500,
            errors: ['user not found']
          }
        end
    end

    def update
        puts '=====hitting update======='
        property = Property.find(params[:id])
        # property.update(property_params)        
        property = Property.find(params[:id])
      property.update(uploads: params[:uploads])
      uploads_url = rails_blob_path(property.uploads)
      render json: { property: property, uploads_url: uploads_url }
      end



      def update_availability
        property = Property.find(params[:id])
        property.update(property_params)  
        uploads_url = rails_blob_path(property.uploads)
        render json: {property: property, uploads_url: uploads_url}
      end       


      

      def property_params
        params.require(:property)
        .permit(
          :user_id,
          :address,
          :rent,
          :bedrooms,
          :bathrooms,
          :sqft,
          :availability,
          :available_date,
          :description,
          :longitude,
          :latitude,
          uploads: [] )
    end


end
