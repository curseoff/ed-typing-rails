class Public::HomeController < Public::BaseController
  def index
    @rooms = Room.public_rooms
  end
end
