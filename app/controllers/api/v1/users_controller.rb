class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { error: 'Unable to create user.' }, status: 400
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    if @user
      @user.destroy
      render json: { message: 'user deleted successfully.' }, status: 200
    else
      render error: { error: 'Unable to delete user.' }, status: 400
    end
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update(user_params)
      render json: { message: 'user successfully updated.' }, status: 200
    else
      render error: { error: 'Unable to update user.' }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
