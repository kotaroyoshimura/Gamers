class Users::CommentsController < ApplicationController

  def create
    game = Game.find(params[:game_id])
    @comment = game.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to game_path(game)
  end

  def destroy
    game = Game.find(params[:game_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to game_path(game)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
