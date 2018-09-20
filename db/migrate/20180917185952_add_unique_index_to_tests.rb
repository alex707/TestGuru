class AddUniqueIndexToTests < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, [:level, :index], unique: true
  end
end
