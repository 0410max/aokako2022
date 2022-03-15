class UsersController < ApplicationController
  before_action :correct_user,only: [:edit]

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
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)

  end

  def index
    @users = User.page(params[:page]).per(30).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
    @number2 = @user.number.slice(1)
    @number3 = @user.number.slice(2)
    @number4 = @user.number.slice(3)
    @number5 = @user.number.slice(4)
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)
    
  end

  def update
    @user = User.find(params[:id])
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
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)
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
    @number6 = @user.number.slice(5)
    @number7 = @user.number.slice(6)
    @number8 = @user.number.slice(7)
  end

  def search
    if params[:dep].present?
      @users = User.where('dep LIKE ?', "#{params[:dep]}")
      @users = @users.page(params[:page]).per(30)
    else
      @users = User.none
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image,:year,:introduction,:number,:dep,:cor)
   end

  def correct_user
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    elsif current_user.number.slice(1) == 'C' && current_user.number.slice(2) == 'C' && current_user.number.slice(3) == 'C' && current_user.number.slice(4) == 'C' && current_user.number.slice(5) == 'C' && current_user.number.slice(6) == 'C' && current_user.number.slice(7) == 'C'
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end
end

