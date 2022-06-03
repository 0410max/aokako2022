class Public::KakomonCommentsController < ApplicationController
    def create
        @kakomon = Kakomon.find(params[:kakomon_id])
        comment = current_end_user.kakomon_comments.new(comment_params)
        comment.kakomon_id = @kakomon.id
        comment.user_id = current_end_user.id
        comment.save
        @kakomon.create_notification_comment!(current_end_user, comment.id)
        redirect_to kakomon_path(@kakomon)
    end

    def destroy
        kakomon_comment = KakomonComment.find(params[:id]).destroy
        redirect_to request.referer
    end

    private 

    def comment_params
        params.require(:kakomon_comment).permit(:comment)
    end
end
