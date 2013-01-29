class Public::RoomsController < Public::BaseController
  def show
    @room = Room.find(params[:id])
  end
end