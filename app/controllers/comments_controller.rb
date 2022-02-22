class CommentsController < ApplicationController
  def create
    @kakomon = Kakomon.find(params[:kakomon_id])
    comment = current_user.comments.new(comment_params)
    comment.kakomon_id = @kakomon.id
    comment.user_id = current_user.id
    comment.save
    redirect_to request.referer
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
