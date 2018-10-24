class SurveysController < ApplicationController

  before_action :find_survey, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @survey.accept!(params[:answer_ids])

    if @survey.completed?
      TestsMailer.completed_test(@survey).deliver_now
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
