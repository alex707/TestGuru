class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct, default: false
      t.integer :question_id, null: false

      t.timestamps
    end
  end
end
