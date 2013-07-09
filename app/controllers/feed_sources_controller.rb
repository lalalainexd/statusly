class FeedSourcesController < ApplicationController
  before_filter :require_login
  def create

    request = current_user.pending_requests.find_by_requestor_id(params[:user])
    source = request.requestor.add_feed_source(current_user)
    if source
      request.destroy
    end
    redirect_to root_path
  end
end
