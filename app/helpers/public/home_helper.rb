# encoding: UTF-8
module Public::HomeHelper
  def room_join room
    if room.users.find_by_id @current_user.id
      button_to '退席する', public_room_user_path(room, @current_user), :method => 'delete'
    else
      button_to '参加する', public_room_users_path(room)
    end
  end
end
