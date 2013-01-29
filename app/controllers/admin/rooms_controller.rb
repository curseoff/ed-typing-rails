class Admin::RoomsController < Public::BaseController
  def new
    @room = @current_user.rooms.new
    @rooms = @current_user.myrooms
  end
  
  def edit
    @room = @current_user.rooms.find(params[:id])
    @rooms = @current_user.myrooms
  end  

  def create
    @room = @current_user.rooms.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to edit_admin_room_path(@room), notice: 'Eng was successfully updated.' }
        format.json { head :no_content }
      else
        @rooms = @current_user.myrooms
        format.html { render action: "new" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @room = @current_user.rooms.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to edit_admin_room_path(@room), notice: 'Eng was successfully updated.' }
        format.json { head :no_content }
      else
        @rooms = @current_user.myrooms
        format.html { render action: "edit" }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end
end
