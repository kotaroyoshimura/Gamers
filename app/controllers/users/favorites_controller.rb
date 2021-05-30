class Users::FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, game_id: params[:id])
    @game = Game.find(params[:id])
  end

  def destroy
    Favorite.find_by(user_id: current_user.id, game_id: params[:id]).destroy
    @game = Game.find(params[:id])
  end
end
