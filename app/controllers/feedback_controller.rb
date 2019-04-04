class FeedbackController < ApplicationController
  def new
  end

  def create
    Admin.pluck(:email).each do |email|
      FeedbackMailer.send_feedback(email, params['body']).deliver_now
    end

    redirect_to root_path, notice: t('.flash')
  end
end
