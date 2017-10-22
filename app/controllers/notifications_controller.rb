# Notifications controller for the notification model
class NotificationsController < ApplicationController
  before_action :set_user, only: %i[index]
  def index
    @notifications = @user.notifications
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
