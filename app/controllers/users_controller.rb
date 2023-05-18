class UsersController < ApplicationController
  def register
    user = User.new(user_param)
    if user.save
      token = JWT.encode({user_id:user.id},Rails.application.secrets.secret_key_base)
      render json: {token:token}
    else
      render json: {error:user.errors.full_messages}
    end
  end
  private
  def user_param
    params.permit(:name,:email,:password)
  end

  def session
    user = User.find_by(email:params[:email])
    if user && user.authenticate(params[:password])
        token =JWT.encode({user_id:user.id},Rails.application.secrets.secret_key_base)
        render json: {token:token}
    else
        render json: {error: "invalid email or password"}
    end

  end
  def destroy
    user =User.find(params[:id])
    if user.destroy
      render json: {message: "User deleted"}
    end
  end
  
end
