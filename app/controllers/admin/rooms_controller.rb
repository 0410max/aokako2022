class Admin::RoomsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @rooms = current_end_user.rooms.joins(:messages).includes(:messages).order("messages.created_at DESC")
  end

  def show
    @rooms = current_end_user.rooms.joins(:messages).includes(:messages).order("messages.created_at DESC")
    @room = Room.find(params[:id])  
    if RoomUser.where(end_user_id: current_end_user.id, room_id: @room.id).present?
      @messages = @room.messages.order("messages.created_at asc")
      @message = Message.new
      @RoomUsers = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end
    @room.end_users.each do |user|
      if user.name != current_end_user.name
        @anotherUser = user 
      end 
    end 
  end

end


