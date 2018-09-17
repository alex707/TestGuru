class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  validate :allow_count, on: :create

  private

  def allow_count
    cnt = Question.find(self.question_id).answers.count
    if cnt > 5
      errors.add(:answers, 'count of answers must be less then 5 (i.e. 1..4)')
      return false
    # elsif cnt < 1
    #   errors.add(:answers, 'count of answers must be more than 0 (i.e. 1..4)')
    #   return false
    end
    true
  end
end
