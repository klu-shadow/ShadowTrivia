class QuestionsController < ApplicationController
  before_action :ensure_logged_in, only: [:new, :create]
  def new
    @question = Question.new()
  end

  def create
    question_type = params[:question][:type]
    case question_type
    when 'MultipleChoice'
      @question = MultipleChoice.new(question_params)
    when 'TrueOrFalse'
      @question = TrueOrFalse.new(question_params)
    end
    @question.user_id = current_user.id 
    
  end


private
  def question_params
    params.require(:question).permit(:body, :choices, :correct_answer, :category_id, :type)
  end
end
