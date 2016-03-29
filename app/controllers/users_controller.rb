class UsersController < ApplicationController

  before_action :require_manager, except: [:login]
  
  @@roles = %w(employee manager) #TODO put in db

  def login
  end

  def index
    @users = User.all.order(:name)
  end

  def new
      @user = User.new
      @roles = @@roles
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
    @roles = @@roles
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to edit_user_path(params[:id])
    end
  end

  def destroy
    if User.find(params[:id]).destroy
      redirect_to users_path
    else
      redirect_to edit_user_path(params[:id])
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :role)
  end
end
