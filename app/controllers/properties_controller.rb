class PropertiesController < ApplicationController

    def index 
        properties = Property.all 
        render json: properties
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

    create_table "properties", force: :cascade do |t|
        t.bigint "user_id", null: false
        t.string "address"
        t.string "rent"
        t.string "bedrooms"
        t.string "bathrooms"
        t.string "sqft"
        t.boolean "availability"
        t.string "available_date"
        t.string "description"
        t.float "longitude"
        t.float "latitude"
        t.datetime "created_at", precision: 6, null: false
        t.datetime "updated_at", precision: 6, null: false
        t.index ["user_id"], name: "index_properties_on_user_id"
      end


end
