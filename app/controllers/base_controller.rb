class BaseController < ApplicationController
  before_filter :current_user
  
  def current_user
    @current_user = session[:current_user]
  end
end
