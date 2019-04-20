class SurveysController < ApplicationController

  before_action :find_survey, only: %i[show update result gist]

  def show
  end

  def result
    @badges = @survey.success? ? BadgeCheckerService.check(@survey) : []
  end

  def update
    @survey.accept!(params[:answer_ids])

    if @survey.completed?
      BadgeCheckerService.award(@survey)

      TestsMailer.completed_test(@survey).deliver_now
      redirect_to result_survey_path(@survey)
    else
      render :show
    end
  end

  def gist
    res_obj = GistQuestionService.new(@survey).call

    if res_obj.success?
      Gist.create!({
        user: @survey.user,
        question: @survey.current_question,
        url: res_obj.url,
        content: res_obj.content
      })
      flash[:notice] = view_context.link_to(t('.success'), res_obj.url, target: '_blank')
    else
      flash[:alert] = t('.failure')
    end

    redirect_to @survey
  end

  private

  def find_survey
    @survey = Survey.find(params[:id])
  end
end
