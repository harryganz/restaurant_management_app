class UsersController < ApplicationController
  def login
  end

  def new
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
