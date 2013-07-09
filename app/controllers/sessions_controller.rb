class SessionsController < ApplicationController

  def create
    @user = login(params[:username], params[:password])
    if @user
      redirect_to @user
    else
      redirect_back_or_to root_path
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
