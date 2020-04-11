class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :landlord_applications]
    
    def index
      users = User.all 
      render json: users
    end

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
      end    

    def create
        @user = User.create(user_params)
        if @user.valid?
          @token = encode_token(user_id: @user.id)
          render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
    
  def landlord_properties
    user = User.find(params[:id])
    allUserProperties = Property.all.select{|property| property.user_id == user.id} 
    properties_with_uploads = allUserProperties.map{ |property| { property: property, uploads: rails_blob_path(property.uploads)}}
    userLeasedProperties = properties_with_uploads.select{|property| property[:property].availability}
    userUnleasedProperties = properties_with_uploads.select{|property| !property[:property].availability}

        # property_with_img = Property.joins(:uploads_attachment)


    
     render json: {leased_properties: userLeasedProperties, unleased_properties: userUnleasedProperties}
    end 

     
  private
  def user_params
    params.require(:user).permit(:name, :password, :email, :type)
  end
end

