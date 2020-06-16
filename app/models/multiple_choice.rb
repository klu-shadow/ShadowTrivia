class MultipleChoice < Question
  def self.build(params)
    question = MultipleChoice.new()
    question.body = params[:body]
    question.choices = [ params[:choice_1], params[:choice_2], params[:choice_3], params[:choice_4]]
    correct_index = params[:correct_answer].to_i
    question.correct_answer = question.choices[correct_index]
    return question
  end

end
# == Schema Information
#
# Table name: questions
#
#  id             :integer(8)      not null, primary key
#  body           :text            not null
#  type           :string
#  choices        :string          default("{}"), not null
#  correct_answer :string          not null
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  user_id        :integer(4)      not null
#

