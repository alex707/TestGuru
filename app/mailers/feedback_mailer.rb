class FeedbackMailer < ApplicationMailer

  def send_feedback(email, body)
    @body = body

    mail to: email
  end

end
