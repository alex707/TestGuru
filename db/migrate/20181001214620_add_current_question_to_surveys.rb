class AddCurrentQuestionToSurveys < ActiveRecord::Migration[5.2]
  def change
    add_reference :surveys, :current_question, foreign_key: {to_table: :questions}
    add_column :surveys, :correct_questions, :integer, default: 0
  end
end
