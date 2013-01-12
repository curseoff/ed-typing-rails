class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.integer :user_id
      t.text :data

      t.timestamps
    end
    
    add_index :people, :user_id, :unique => true
  end
end
