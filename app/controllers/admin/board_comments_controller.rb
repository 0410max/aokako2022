class Admin::BoardCommentsController < ApplicationController
    def destroy
        comment = BoardComment.find(params[:id])
        comment.destroy
    end
end
