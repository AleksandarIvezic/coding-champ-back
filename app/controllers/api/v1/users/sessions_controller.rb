class Api::V1::Users::SessionsController < ApiController
  skip_before_action :authenticate_api_v1_user!, only: [:create]

  # POST /resource/sign_in

  def create
    @user = User.find_by(email: params[:email])
    @user.admin = false unless @user.admin
    if @user&.valid_password? params[:password]
      sign_in(@user)
      render json: { message: 'User loged in successfully!',
                     token: JsonWebToken.encode(sub: @user.id),
                     id: current_api_v1_user.id,
                     username: current_api_v1_user.username,
                     user_id: current_api_v1_user.id, admin: current_api_v1_user.admin }
    else
      render json: { errors: ['Invalid email or password'] }
    end
  end
end