class CreateBets < ActiveRecord::Migration
  def up
    create_table :bets do |t|
      t.integer :better_id
      t.integer :bettee_id
      t.integer :commissioner_id
      t.integer :slaps
      t.text :description
      t.datetime :end
      t.timestamp
    end

    add_index :bets, :better_id
    add_index :bets, :bettee_id
    add_index :bets, :commissioner_id
    add_index :bets, [ :better_id, :bettee_id, :commissioner_id ]
  end

  def down
    drop_table :bets
  end
end
