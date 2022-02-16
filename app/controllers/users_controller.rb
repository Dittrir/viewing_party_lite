class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @parties = @user.parties
  end

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
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
