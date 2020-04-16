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
    
 

  # def landlord_applications
  #   user = User.find(params[:id])
  #   pending_applications = Application.all.select{|application| application.landlord_id == user.id && application.status == "Pending"} 
  #   render json: {applications: pending_applications}
  # end 

 
     
  private
  def user_params
    params.require(:user).permit(:name, :password, :email, :type)
  end
end

