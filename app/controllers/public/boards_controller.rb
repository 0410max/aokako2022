class Public::BoardsController < ApplicationController
  def index
    @boards = Board.page(params[:page]).per(20).order(created_at: :desc)
    @comment = BoardComment.new
  end

  def show
    @board = Board.find(params[:id])
    @comments = @board.board_comments.order(created_at: :desc)
    @comment = BoardComment.new
    @report = Report.new
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.end_user_id = current_end_user.id
    if @board.save
      redirect_to end_user_path(@board.end_user)
      flash[:notice] = '投稿されました'
    else
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    flash[:notice] = "削除されました"
    redirect_to end_user_path(current_end_user)
  end

  def search
    if params[:sub].present? || params[:prof].present?
      @boards = Board.where('sub LIKE ? OR prof LIKE ?', "%#{params[:sub]}%","%#{params[:prof]}%")
      @boards = @boards.page(params[:page]).per(10).order(created_at: :desc)
    else
      @boards = Board.none
    end
  end

  private

  def board_params
    params.require(:board).permit(:sub,:prof,:rate1,:rate2,:rate3,:comment)
  end
end
