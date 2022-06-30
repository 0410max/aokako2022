class Public::BoardsController < ApplicationController
  before_action :authenticate_end_user!,except: [:index,:show]
  def index
    @boards = Board.find(Boardfavorite.group(:board_id).order('count(board_id) desc').pluck(:board_id))
    @boards = Kaminari.paginate_array(@boards).page(params[:page]).per(30)
    @comment = BoardComment.new
    @report = Boardreport.new
    dep = current_end_user.dep
    @users = EndUser.where(dep: dep)
  end

  def show
    @board = Board.find(params[:id])  
    @comment = BoardComment.new
    @report = Boardreport.new
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.end_user_id = current_end_user.id
    if @board.save
      redirect_to end_user_path(current_end_user)
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

  def searchSub
    if params[:sub].present?
      @boards = Board.where('sub LIKE ?', "%#{params[:sub]}%")
      @boards = @boards.page(params[:page]).per(3).order(created_at: :desc)
    else
      @boards = Board.none
    end
    @sub = params[:sub]
    @report = Boardreport.new
    @comment = BoardComment.new
    dep = current_end_user.dep
    @users = EndUser.where(dep: dep)
  end

  def searchProf
    if params[:prof].present?
      @boards = Board.where('prof LIKE ?', "%#{params[:prof]}%")
      @boards = @boards.page(params[:page]).per(30).order(created_at: :desc)
    else
      @boards = Board.none
    end
    @prof = params[:prof]
    @report = Boardreport.new
    @comment = BoardComment.new
    dep = current_end_user.dep
    @users = EndUser.where(dep: dep)
  end

  def searchClear
    @boards = Board.find(Boardfavorite.group(:board_id).order('count(board_id) desc').pluck(:board_id))
    @boards = Board.page(params[:page]).per(30)
    @report = Boardreport.new
    @comment = BoardComment.new
    dep = current_end_user.dep
    @users = EndUser.where(dep: dep)
  end

  private

  def board_params
    params.require(:board).permit(:sub,:prof,:rate1,:rate2,:rate3,:comment)
  end
end

