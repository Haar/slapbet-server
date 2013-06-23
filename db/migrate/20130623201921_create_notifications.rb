class CreateNotifications < ActiveRecord::Migration
  def up
    create_table :notifications do |t|
      t.string :notifications
      t.integer :user_id
      t.timestamps
    end

    add_index :notifications, :user_id
  end

  def down
    drop_table :notifications
  end
end
