class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.text :title
      t.text :contents
      t.text :status

      t.timestamps
    end
  end
end
