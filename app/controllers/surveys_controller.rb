class SurveysController < ApplicationController
  before_action :find_survey, only: %i[show update result]

  def show
  end

  def result
    @correct = @survey.correct_questions
    @total = @survey.test.questions.count
    @res = ( (@correct.to_f / @total.to_f).round(2)*100 ).to_i
  end

  def update
    @survey.accept!(params[:answer_ids])

    if @survey.completed?
      redirect_to result_survey_path(@survey)
    else
      render :show
    end
  end

  private

  def find_survey
    @survey = Survey.find(params[:id])
  end
end
