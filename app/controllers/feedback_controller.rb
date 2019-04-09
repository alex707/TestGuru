class FeedbackController < ApplicationController
  def new
  end

  def create
    if params['email'].blank?
      flash[:alert] = t('email_blank')
    elsif params['body'].blank?
      flash[:alert] = t('.body_blank')
    else
      FeedbackMailer.send_feedback(params['email'], params['body']).deliver_now
      flash[:notice] = t('.flash')
    end

    redirect_to root_path
  end
end
