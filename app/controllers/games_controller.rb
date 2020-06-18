class GamesController < ApplicationController

  def create
    category_id = params[:category_id]
    @game = Game.build(current_user.id, category_id)
    if @game.save
      redirect_to game_url(@game)
    end
  end

  def show
    @game = Game.find(params[:id])
    question_id = @game.question_ids[@game.question_number]
    @question = Question.find(question_id)
  end

  def update
    @game = Game.find(params[:id])
    @game.user_answers << game_params[:user_answer]
    @game.check_answer
    if @game.done
      redirect_to category_highscores_url(category_id: @game.category_id)
    else
      redirect_to game_url(@game)
    end
  end

  private
  def game_params
    params.require(:game).permit(:user_answer)
  end
end
