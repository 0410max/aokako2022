class Public::KakomonfavoritesController < ApplicationController
    def create
        @kakomon = Kakomon.find(params[:kakomon_id])
        favorite = current_end_user.kakomonfavorites.new(kakomon_id: @kakomon.id)
        @kakomon.create_notification_thanks!(current_end_user)
        favorite.save
    end

    def destroy
        @kakomon = Kakomon.find(params[:kakomon_id])
        favorite = current_end_user.kakomonfavorites.find_by(kakomon_id: @kakomon.id)
        favorite.destroy
    end
end