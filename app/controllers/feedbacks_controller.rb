class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.feedback

    redirect_to root_path
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :body)
  end
end
