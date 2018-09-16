class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :right_answers, -> { where(correct: true) }
end
