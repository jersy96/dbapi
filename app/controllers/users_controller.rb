class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :ok
    else
      render json: user.errors.messages, status: :unprocessable_entity
    end
  end

  def update
    @user.attributes = user_params
    if @user.save
      render json: {successful: 1, user: UserSerializer.new(@user).as_json[:user]}, status: :ok
    else
      render json: {successful: 0, errors: @user.errors.messages}, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(
      :name,
      :lastname,
      :email,
      :password,
      :address
    )
  end
end
