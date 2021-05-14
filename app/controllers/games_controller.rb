class GamesController < ApplicationController

  def show
    @game = Game.find(params[:id])
    @comment = Comment.new
    @comments = @game.comments
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    @game.save
    redirect_to user_path(current_user.id)
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game.id)
  end

  private

  def game_params
    params.require(:game).permit(:title,:body,:genre_id)
  end
end
