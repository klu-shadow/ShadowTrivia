class QuestionsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]
  def new
    @question = Question.new()
  end

  def create
    question_type = params[:question][:type]
    case question_type
    when 'MultipleChoice'
      @question = MultipleChoice.build(question_params)
    when 'TrueOrFalse'
      @question = TrueOrFalse.build(question_params)
    end
    @question.user_id = current_user.id
    if @question.save
      redirect_to categories_url
    end
    
  end


private
  def question_params
    params.require(:question).permit(
      :body, :correct_answer, :category_id, :type, :choice_1, :choice_2,
      :choice_3, :choice_4
    )
  end
end
