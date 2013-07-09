class ApplicationController < ActionController::Base
  protect_from_forgery
  def index
    if logged_in?
      @status = Status.new
    else
      @user = User.new
    end
  end
end
