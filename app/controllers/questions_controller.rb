class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]
  before_action :find_test, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    arr = @test.questions.pluck(:id, :body).map { |elem| "#{elem.first} #{elem.last}" }

    render inline: "#{arr.join("</br>")}"
  end

  def show
    render plain: "#{@question.body}"
  end

  def new
    
  end

  def create
    question = Question.create(question_params)
    render plain: question.inspect
  end

  def destroy
    Question.delete(params[:id])

    render plain: "question #{params[:id]} deleted"
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
