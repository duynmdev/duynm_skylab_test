class QuestionsController < ApplicationController
  def question1
    @answer_1 = question_service.answer_1
  end

  def question2
    @answer_2 = question_service.answer_2
  end

  def question3
    @answer_3 = question_service.answer_3
  end

  def question4
    @answer_4 = question_service.answer_4
  end

  private
    def question_service
      @question_service ||= QuestionService.new
    end
end