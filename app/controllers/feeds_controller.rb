class FeedsController < ApplicationController
  before_filter :require_login

  def create

    user_to_follow = User.find_by_id(params[:user])
    if user_to_follow
      current_user.add_feed_source(user_to_follow)
    else
      flash[:error] = "You can't follow that person"
    end
    redirect_to current_user

  end

end
