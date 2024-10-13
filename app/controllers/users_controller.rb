class UsersController < ApplicationController
  def index
    users = UserRepository.new.all
    render json: users
  end

  def show
    user = UserRepository.new.find(params[:id])
    render json: user
  end

  def create
    user = UserService.new.create_user(user_params)
    render json: user, status: :created
  end

  def update
    user = UserService.new.update_user(params[:id], user_params)
    render json: user
  end

  def destroy
    UserService.new.delete_user(params[:id])
    head :no_content
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
