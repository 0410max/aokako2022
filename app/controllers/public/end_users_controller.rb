class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  def index
    dep = current_end_user.dep
    @users = EndUser.where(dep: dep)
  end

  def show
    dep = current_end_user.dep
    @users = EndUser.where(dep: dep)
    
    @user = EndUser.find(params[:id])
    @boards = @user.boards.order(created_at: :desc)
    @kakomons = @user.kakomons.order(created_at: :desc)
    @comment = KakomonComment.new

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

    @report = Userreport.new

  end

  def edit
    @user = EndUser.find(params[:id])
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

  private

  def user_params
    params.require(:end_user).permit(:name,:profile_image,:year,:introduction,:number,:dep,:cor)
  end

  def correct_user
    @user = EndUser.find(params[:id])
    if @user == current_end_user
      render :edit
    else
      redirect_to end_user_path(current_end_user.id)
    end
  end
end


