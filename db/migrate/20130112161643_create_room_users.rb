class CreateRoomUsers < ActiveRecord::Migration
  def change
    create_table :room_users do |t|
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
    
    add_index :room_users, :user_id, :unique => true
  end
end
