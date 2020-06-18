class HighscoresController < ApplicationController
  def index
    @highscores = HighScore.includes(:user, :category).all
      .where(category_id: params[:category_id])
      .order(score: 'DESC')
      .limit(50)
  end
end
