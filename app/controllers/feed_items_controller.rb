class FeedItemsController < ApplicationController
  respond_to :json

  before_filter :require_login

  def index
    @feed_items = current_user.feed_items(params[:after])
    respond_with @feed_items
  end

end
