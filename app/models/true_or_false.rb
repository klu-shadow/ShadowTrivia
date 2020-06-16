class TrueOrFalse < Question
  after_initialize :populate_choices

  def self.build(params)
    question = TrueOrFalse.new()
    question.body = params[:body]
    correct_index = params[:correct_answer].to_i
    question.correct_answer = question.choices[correct_index]
    return question
  end

  def populate_choices
    self.choices = ['true', 'false']
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

