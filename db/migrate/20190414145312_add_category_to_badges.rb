class AddCategoryToBadges < ActiveRecord::Migration[5.2]
  def change
    add_column :badges, :category_id, :integer, null: true
    add_column :badges, :level, :integer, null: true

    add_foreign_key :badges, :categories, column: :category_id
    add_index :badges, :category_id
  end
end
