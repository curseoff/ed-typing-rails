class Public::UsersController < Public::BaseController
  def create
    ActiveRecord::Base.transaction do
      RoomUser.delete_all(:user_id => @current_user.id)
      Room.find(params[:room_id]).users << @current_user
    end
    redirect_to root_url
  end
  
  def destroy
    Room.find(params[:room_id]).users.delete @current_user
    redirect_to root_url
  end
end
