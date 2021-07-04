class Admin::GamesController < ApplicationController
  def index
    @game  = Game.all
  end
  
  def show
    @game = Game.find(params[:id])
    @user = @game.user
    @comment = Comment.new
    @comments = @game.comments
  end
end
