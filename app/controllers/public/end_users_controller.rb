class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def index
    @users = EndUser.all
  end
  
  def show
    @user = EndUser.find(params[:id])
    @kakomons = @user.kakomons.order(created_at: :desc)
    @comment = Comment.new

    @currentRoomUser = RoomUser.where(end_user_id: current_end_user.id)  
    @receiveUser = RoomUser.where(end_user_id: @user.id)  
    
    unless @user.id == current_end_user.id  
      @currentRoomUser.each do |cu|    
        @receiveUser.each do |u|
          if cu.room_id == u.room_id    
            @haveRoom = true    
            @roomId = cu.room_id   
          end
        end
      end
      unless @haveroom   
        @room = Room.new
        @RoomUser = RoomUser.new
      end
    end

    @number2 = @user.number.slice(1)
    @number3 = @user.number.slice(2)
    @number4 = @user.number.slice(3)
    @number5 = @user.number.slice(4)
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)

  end

  def edit
    @user = EndUser.find(params[:id])
    @number2 = @user.number.slice(1)
    @number3 = @user.number.slice(2)
    @number4 = @user.number.slice(3)
    @number5 = @user.number.slice(4)
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)
    
  end

  def update
    @user = EndUser.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "保存されました"
      redirect_to end_user_path(@user.id)
    else
      render :edit
    end
  end

  def followings
    @user = EndUser.find(params[:id])
    @users = @user.followings

    @currentRoomUser = RoomUser.where(end_user_id: current_end_user.id)  
    @receiveUser = RoomUser.where(end_user_id: @user.id)  
    
    unless @user.id == current_end_user.id  
      @currentRoomUser.each do |cu|    
        @receiveUser.each do |u|   
          if cu.room_id == u.room_id    
            @haveRoom = true    
            @roomId = cu.room_id   
          end
        end
      end
      unless @haveroom   
        @room = Room.new
        @RoomUser = RoomUser.new
      end
    end
    @number2 = @user.number.slice(1)
    @number3 = @user.number.slice(2)
    @number4 = @user.number.slice(3)
    @number5 = @user.number.slice(4)
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)
  end

  def followers
    @user = EndUser.find(params[:id])
    @users = @user.followers

    @currentRoomUser = RoomUser.where(end_user_id: current_end_user.id)  
    @receiveUser = RoomUser.where(end_user_id: @user.id)  
    
    unless @user.id == current_end_user.id  
      @currentRoomUser.each do |cu|    
        @receiveUser.each do |u|   
          if cu.room_id == u.room_id    
            @haveRoom = true    
            @roomId = cu.room_id   
          end
        end
      end
      unless @haveroom   
        @room = Room.new
        @RoomUser = RoomUser.new
      end
    end
    @number2 = @user.number.slice(1)
    @number3 = @user.number.slice(2)
    @number4 = @user.number.slice(3)
    @number5 = @user.number.slice(4)
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)
  end

  def board 
    @user = EndUser.find(params[:id])
    @boards = @user.boards.order(created_at: :desc)
  end


  private

  def user_params
    params.require(:end_user).permit(:name,:profile_image,:year,:introduction,:number,:dep,:cor)
   end

  def correct_user
    @user = User.find(params[:id])
    if @user == current_end_user
      render :edit
    else
      redirect_to end_user_path(current_end_user.id)
    end
  end
end


