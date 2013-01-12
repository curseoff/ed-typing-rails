class Public::ChatController < Public::BaseController
  def index
    
  end
  
  def create
    @message = params[:message]
  end
end
