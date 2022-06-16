class Admin::KakomonfavoritesController < ApplicationController
    def create
        @kakomons = Kakomon.all
        @kakomon = Kakomon.find(params[:kakomon_id])
        user = EndUser.find(1)
        favorite = user.kakomonfavorites.new(kakomon_id: @kakomon.id)
        favorite.save
    end
end
