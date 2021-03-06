class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :check_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def check_count
    cnt = self.question.answers.count
    if cnt >= 4
      errors.add(:answers, 'count of answers must be less then 5 (i.e. 1..4)')
      return false
    end
    true
  end
end
