class UsersController < ApplicationController

  def create
    attributes = params[:user]
    user = User.create_with_password(attributes[:username],attributes[:password], attributes[:password_confirmation])
    if user
      auto_login(user)
      redirect_to user_path(user)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
