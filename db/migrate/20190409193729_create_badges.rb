class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :icon
      t.string :description
      t.string :rule
      t.integer :param

      t.timestamps
    end
  end
end
