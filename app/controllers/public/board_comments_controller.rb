class Public::BoardCommentsController < ApplicationController
    def create
        @board = Board.find(params[:board_id])
        comment = current_end_user.board_comments.new(comment_params)
        comment.board_id = @board.id
        comment.end_user_id = current_end_user.id
        comment.save
        @board.create_notification_comment!(current_end_user, comment.id)
        redirect_to board_path(@board)
    end

    def destroy
        board_comment = BoardComment.find(params[:id]).destroy
        redirect_to request.referer
    end

private

    def comment_params
        params.require(:board_comment).permit(:comment)
    end
end
