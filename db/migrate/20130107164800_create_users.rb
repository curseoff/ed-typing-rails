class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :provider, :null => false
      t.text :uid, :null => false
      t.timestamps
    end
    
    add_index :users, :uid, :unique => true
  end
end
