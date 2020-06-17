class TaggingsController < ApplicationController
  def new
    @categories = Category.all
  end

  def create
    question_id = params[:question_id]
    Tagging.build(tagging_params, question_id)
    redirect_to categories_url
  end

  def tagging_params
    params.require(:tagging).permit(category:{})
  end
end
