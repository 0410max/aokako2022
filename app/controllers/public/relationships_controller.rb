class Public::RelationshipsController < ApplicationController
    def create
      following = current_end_user.relationships.build(follower_id: params[:end_user_id])
      follower = EndUser.find(params[:end_user_id])
      @user = EndUser.find(follower.id)
      @user.create_notification_follow!(current_end_user)
      following.save
    end
  
    def destroy
      following = current_end_user.relationships.build(follower_id: params[:end_user_id])
      follower = EndUser.find(params[:end_user_id])
      @user = EndUser.find(follower.id)
      following = current_end_user.relationships.find_by(follower_id: params[:end_user_id])
      following.destroy
    end
end