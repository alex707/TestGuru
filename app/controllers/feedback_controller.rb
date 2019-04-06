class FeedbackController < ApplicationController
  def new
  end

  def create
    FeedbackMailer.send_feedback(current_user.email, params['body']).deliver_now

    redirect_to root_path, notice: t('.flash')
  end
end
