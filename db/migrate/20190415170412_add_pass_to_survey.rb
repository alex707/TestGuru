class AddPassToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :pass, :boolean
  end
end
