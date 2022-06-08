class Public::NotificationsController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @notifications = current_end_user.passive_notifications.page(params[:page]).per(30)
    @notifications.where(action:'follow',checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @notifications.where(action:'comment',checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @notifications.where(action:'board_comment',checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
    @notifications.where(action:'thanks',checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
