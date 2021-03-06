class Users::GamesController < ApplicationController

  def index
    @game = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @user = @game.user
    @comment = Comment.new
    @comments = @game.comments
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.score = Language.get_data(game_params[:body])  #この行を追加
    @game.user = current_user
    if @game.save
      redirect_to games_path
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private

  def game_params
    params.require(:game).permit(:title,:body,:genre_id)
  end
end
