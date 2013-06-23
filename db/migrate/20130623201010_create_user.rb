class CreateUser < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :username
      t.timestamps
    end

    add_index :users, :username
  end

  def down
    drop_table :users
  end
end
