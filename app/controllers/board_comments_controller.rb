class BoardCommentsController < ApplicationController
    def create
        @board = Board.find(params[:board_id])
        comment = current_user.comments.new(comment_params)
        comment.board_id = @board.id
        comment.user_id = current_user.id
        comment.save
        @board.create_notification_comment!(current_user, comment)
        redirect_to board_path(@board)
    end

    def destroy
        Comment.find(params[:id]).destroy
        redirect_to request.referer
    end

private

    def comment_params
        params.require(:board_comment).permit(:comment)
    end
end
