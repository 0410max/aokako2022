class BoardsController < ApplicationController
  def index
    @boards = Board.page(params[:page]).per(20).order(created_at: :desc)
    @comment = Comment.new
  end

  def show
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to user_path(@board.user)
      flash[:notice] = '投稿されました'
    else
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    flash[:notice] = "削除されました"
    redirect_to user_path(current_user)
  end

  private

  def board_params
    params.require(:board).permit(:sub,:prof,:rate1,:rate2,:rate3,:comment)
  end
  
end
