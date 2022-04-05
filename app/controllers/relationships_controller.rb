class RelationshipsController < ApplicationController
    before_action :authenticate_user!
  def create
    following = current_user.relationships.build(follower_id: params[:user_id])
    follower = User.find(params[:user_id])
    @user = User.find(follower.id)
    following.save
    @user.create_notification_follow!(current_user)
    redirect_to request.referrer
  end

  def destroy
    following = current_user.relationships.find_by(follower_id: params[:user_id])
    following.destroy
    redirect_to request.referrer
  end
end
