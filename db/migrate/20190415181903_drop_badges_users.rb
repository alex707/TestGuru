class DropBadgesUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :badges_users
  end
end
