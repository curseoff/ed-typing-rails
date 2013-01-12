class SessionsController < ApplicationController
  def create
    session[:current_user] = User.find_or_create_from_auth_hash(auth_hash)
    redirect_to "/public/chat"
  end
  
  def destroy
    session[:current_user] = nil
    redirect_to root_url
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end