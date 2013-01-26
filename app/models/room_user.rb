class RoomUser < ActiveRecord::Base
  attr_accessible :room_id, :user_id
  
  belongs_to :room
  belongs_to :user
end
