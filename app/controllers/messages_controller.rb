class MessagesController < ApplicationController
  before_action :authenticate_user! 

  def create
    if RoomUser.where(user_id: current_user.id, room_id: params[:message][:room_id]).present?
      @message = Message.new(message_params)
      @room=@message.room
      if @message.save
        @roommembernotme=RoomUser.where(room_id: @room.id).where.not(user_id: current_user.id)
        @theid=@roommembernotme.find_by(room_id: @room.id)
        notification = current_user.active_notifications.new(
            visited_id: @theid.user_id,
            visitor_id: current_user.id,
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

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
    redirecto_to request.referer
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :room_id, :message).merge(user_id: current_user.id)
  end
end

