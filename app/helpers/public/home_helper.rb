# encoding: UTF-8
module Public::HomeHelper
  def room_join room
    if room.users.find_by_id @current_user.id
      button_to '部屋へ', public_room_url(room.id), :method => 'get'
    else
      button_to_entering_room room
    end
  end
  
  def button_to_entering_room room
    button_to '参加する', public_room_users_path(room)
  end
  
  def button_to_leave_room room
    button_to '退席する', public_room_user_path(room, @current_user), :method => 'delete'
  end
end
