class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, :null => false
      t.integer :room_id, :null => false
      t.text :contents, :null => false
      t.timestamps
    end
    
    add_index :messages, [:room_id, :user_id]
  end
end
