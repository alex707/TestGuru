class AddSuccessToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :success, :boolean, default: false, null: false
  end
end
