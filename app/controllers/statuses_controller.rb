class StatusesController < ApplicationController
  respond_to :json

  before_filter :require_login, only: [:create]

  def create
    @status = current_user.statuses.create(params[:status])
    respond_with @status, root: false
  end

end
