class SurveysController < ApplicationController

  before_action :find_survey, only: %i[show update result gist]

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

  def gist
    res_url = GistQuestionService.new(@survey).call
    redirect_to @survey, view_context.flash_message(res_url)
  end

  private

  def find_survey
    @survey = Survey.find(params[:id])
  end
end
