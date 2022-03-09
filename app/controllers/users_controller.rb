class UsersController < ApplicationController
  before_action :correct_user,only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @kakomons = @user.kakomons.order(created_at: :desc)
    @comment = Comment.new

    @currentRoomUser = RoomUser.where(user_id: current_user.id)  
    @receiveUser = RoomUser.where(user_id: @user.id)  
    
    unless @user.id == current_user.id  
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
  end


  def index
    @users = User.page(params[:page]).per(30)
  end

  def edit
    @user = User.find(params[:id])
    @number2 = @user.number.slice(1)
    @number3 = @user.number.slice(2)
    @number4 = @user.number.slice(3)
    @number5 = @user.number.slice(4)
    
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    if @user.save
      flash[:notice] = "保存されました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings

    @currentRoomUser = RoomUser.where(user_id: current_user.id)  
    @receiveUser = RoomUser.where(user_id: @user.id)  
    
    unless @user.id == current_user.id  
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
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers

    @currentRoomUser = RoomUser.where(user_id: current_user.id)  
    @receiveUser = RoomUser.where(user_id: @user.id)  
    
    unless @user.id == current_user.id  
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
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:year,:introduction)
   end

  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end
end

