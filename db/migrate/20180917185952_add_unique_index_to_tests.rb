class AddUniqueIndexToTests < ActiveRecord::Migration[5.2]
  def change
    add_index :tests, [:title, :level], unique: true
    add_index :tests, [:level]
  end
end
