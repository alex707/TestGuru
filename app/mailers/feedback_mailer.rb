class FeedbackMailer < ApplicationMailer

  def send_feedback(user, body)
    @body = body
    @user = user

    mail
  end

end
