module ApplicationHelper
  def entering_rooms
    @entering_rooms ||= @current_user.entering_rooms
  end
end
