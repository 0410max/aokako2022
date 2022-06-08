class Public::RoomsController < ApplicationController
  before_action :authenticate_end_user!
  def create
    @room = Room.create
    @joinCurrentUser = RoomUser.create(end_user_id: current_end_user.id, room_id: @room.id)
    @joinUser = RoomUser.create(join_room_params)
    @rooms = current_end_user.rooms
    redirect_to room_path(@room.id)
  end

  def show
    @rooms = current_end_user.rooms
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
    @notification = Notification.where(action:'dm',visited_id:current_end_user.id,visitor_id:@anotherUser.id,checked:false).update(checked: true)
  end

  def index
    @rooms = current_end_user.rooms
  end
  
  private

  def join_room_params
    params.require(:room_user).permit(:end_user_id, :room_id).merge(room_id: @room.id)
  end
end



