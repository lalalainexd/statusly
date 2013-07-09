class PendingRequestsController < ApplicationController

  before_filter :require_login

  def create
    user_to_follow = User.find_by_id(params[:user])
    if user_to_follow
      request = user_to_follow.pending_requests.create(requestor: current_user)
    else
      flash[:error] = "You can't follow that person"
    end
    redirect_to current_user

  end
end
