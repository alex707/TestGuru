class Feedback
  include ActiveModel::Model

  attr_accessor :email, :body

  validates :body, presence: true
  validates :email, format: { with: /\A.+@.+\z/ }, presence: true

  def feedback
    if valid?
      FeedbackMailer.send_feedback(self.email, self.body).deliver_now
    end
  end
end
