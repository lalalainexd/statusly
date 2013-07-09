class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    if logged_in?
      @status = Status.new
      render "index"
    else
      @user = User.new
      render "login"
    end
  end
end
