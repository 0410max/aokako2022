class RoomsController < ApplicationController
  before_action :authenticate_user!

  def create
    @room = Room.create
    @joinCurrentUser = RoomUser.create(user_id: current_user.id, room_id: @room.id)
    @joinUser = RoomUser.create(join_room_params)
    redirect_to room_path(@room.id)
  end

  def show
    @room = Room.find(params[:id]) 
    if RoomUser.where(user_id: current_user.id, room_id: @room.id).present?
      @messages = @room.messages.order("messages.created_at asc")
      @message = Message.new
      @RoomUsers = @room.room_users
    else
      redirect_back(fallback_location: root_path)
    end

    if Read.create(room_id:@room.id,user_id:current_user.id)
      @read = Read.update(checked:true)
    end
  end
  
  private

  def join_room_params
    params.require(:room_user).permit(:user_id, :room_id).merge(room_id: @room.id)
  end
end