class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = EndUser.find(params[:end_user_id])
    @rooms = @user.rooms.joins(:messages).includes(:messages).order("messages.created_at DESC")
  end

  def show
    @room = Room.find(params[:id])  
    @user = EndUser.find(params[:end_user_id])
    @rooms = @user.rooms.joins(:messages).includes(:messages).order("messages.created_at DESC")
    @room.end_users.each do |user|
      if user.name != @user.name
        @anotherUser = user 
      end 
    end 
  end
end

