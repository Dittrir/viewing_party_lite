class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end

  def new
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to user_path(user.id)
    else
      flash[:alert] = "Error: Name can't be blank, Email can't be blank and must be valid."
      redirect_to "/register"
    end
  end

  def discover
    @user = User.find(params[:id])
  end

private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end
end
