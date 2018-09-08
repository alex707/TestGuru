class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.integer :user_id
      t.integer :test_id

      t.timestamps
    end

    add_index :surveys, [:user_id, :test_id]
  end
end
