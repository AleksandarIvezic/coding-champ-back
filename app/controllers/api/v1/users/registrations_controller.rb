class Api::V1::Users::RegistrationsController < ApiController
  skip_before_action :authenticate_api_v1_user!, only: [:create]

  # POST /resource
  def create
    @user = User.new(user_params)
    @user.admin = false unless @user.admin
    if @user.save
      # sign_in(@user)
      render json: { message: 'User successfully registered!',
                     token: JsonWebToken.encode(sub: @user.id),
                     name: @user.name,
                     image: @user.image,
                     admin: @user.admin }
    else
      render json: { errors: ['Registration failed!', @user.errors] }
    end
  end

  # private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :image, :admin)
  end
end
