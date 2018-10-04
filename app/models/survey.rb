class Survey < ApplicationRecord

  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_next_question, on: %i[create update]

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def number
    self.test.questions.order(:id).where('id <= ?', self.current_question.id).count
  end

  def total
    self.test.questions.count
  end

  private

  def before_validation_set_next_question
    next_question
  end

  def correct_answer?(answer_ids)
    !answer_ids.nil? && correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if self.current_question.nil?
      self.current_question = test.questions.order(:id).first 
    else
      self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end
end
