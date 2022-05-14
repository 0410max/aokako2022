class Public::BoardsController < ApplicationController
  before_action :authenticate_end_user!,except: [:index,:show]
  def index
    @boards = Board.page(params[:page]).per(20).order(created_at: :desc)
    @comment = BoardComment.new
    @report = Report.new
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
      redirect_to controller: :end_users, action: :board, id: current_end_user.id
      flash[:notice] = '投稿されました'
    else
      render :new
    end
  end

  def destroy
    board = Board.find(params[:id])
    board.destroy
    flash[:notice] = "削除されました"
    redirect_to controller: :end_users, action: :board, id: current_end_user.id
  end

  def search
    if params[:sub].present? || params[:prof].present?
      @boards = Board.where('sub LIKE ?', "%#{params[:sub]}%")
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
