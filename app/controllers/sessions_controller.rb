class SessionsController < ApplicationController
  def new
  end

  def create
    session[:email] = params[:email]
  end
  
  def destroy
    session[:email] = nil
    redirect_to new_session_path
  end
end
