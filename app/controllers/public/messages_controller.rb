class Public::MessagesController < ApplicationController
  before_action :authenticate_end_user! 
  def create
    if RoomUser.where(end_user_id: current_end_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      @room=@message.room
      if @message.save
        @roommembernotme=RoomUser.where(room_id: @room.id).where.not(end_user_id: current_end_user.id)
        @theid=@roommembernotme.find_by(room_id: @room.id)
        notification = current_end_user.active_notifications.new(
            visited_id: @theid.end_user_id,
            visitor_id: current_end_user.id,
            action: 'dm'
        )
        if notification.visitor_id == notification.visited_id
            notification.checked = true
        end
        notification.save if notification.valid?
        redirect_to room_path(@room)
      end
    else
      flash[:alert] = "メッセージの送信に失敗しました。"
    end
  end


  private
  def message_params
    params.require(:message).permit(:end_user_id, :room_id, :message).merge(end_user_id: current_end_user.id)
  end
end
