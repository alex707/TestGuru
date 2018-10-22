class AddNameAndTypeAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
#    remove_column :users, :name
#    remove_column :users, :first_name
#    remove_column :users, :last_name
#    remove_index :users, :type

    add_column(:users, :name, :string)
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column(:users, :type, :string, null: false, default: 'User')
    add_index :users, :type
  end
end
