class NotificationController < ApplicationController
  def index
    notif = Notification.all.order(created_at: :desc).limit(10)
    render json: notif
  end
end
