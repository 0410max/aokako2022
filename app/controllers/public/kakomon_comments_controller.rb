class Public::KakomonCommentsController < ApplicationController
    def create
        @kakomon = Kakomon.find(params[:kakomon_id])
        @comments = @kakomon.kakomon_comments.order(created_at: :desc)
        comment = current_end_user.kakomon_comments.new(comment_params)
        comment.kakomon_id = @kakomon.id
        comment.end_user_id = current_end_user.id
        comment.save
        @comment = KakomonComment.new
    end

    def destroy
        KakomonComment.find(params[:id]).destroy
        @kakomon = Kakomon.find(params[:kakomon_id])
        @comments = @kakomon.kakomon_comments.order(created_at: :desc)
        @comment = KakomonComment.new
    end
    private

    def comment_params
        params.require(:kakomon_comment).permit(:comment)
    end
end
