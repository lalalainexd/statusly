class StatusesController < ApplicationController
  respond_to :json

  before_filter :require_login, only: [:create]

  def create
    @status = current_user.statuses.create(params[:status])
    notify_subscriber
    respond_With @status
  end

  private
  def notify_subscriber
    client = Faye::Client.new("http://localhost:9292/faye")
    client.publish("/#{current_user.username}/status", @status.to_json)
  end
end
