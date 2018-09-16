class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :answers_count

  private

  def answers_count
    if answers.count > 5
      errors.add(:answers, 'count of answers must be less then 5 (i.e. 1..4)')
    elsif answers.count < 1
      errors.add(:answers, 'count of answers must be more than 0 (i.e. 1..4)')
    end
  end
end
