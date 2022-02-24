class FavoritesController < ApplicationController
  def create
    kakomon = Kakomon.find(params[:kakomon_id])
    favorite = current_user.favorites.new(kakomon_id: kakomon.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    kakomon = Kakomon.find(params[:kakomon_id])
    favorite = current_user.favorites.find_by(kakomon_id: kakomon.id)
    favorite.destroy
    redirect_to request.referer
  end
end
