class SessionsController < ApplicationController
  def index
    
  end
  
  def create
    session[:current_user] = User.find_or_create_from_auth_hash(auth_hash)
    redirect_to root_url
  end
  
  def destroy
    session[:current_user] = nil
    redirect_to login_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end