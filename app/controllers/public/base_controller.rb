class Public::BaseController < BaseController
  before_filter :login?
  
  def login?
    if @current_user.blank?
      redirect_to root_url
    end
  end
end
