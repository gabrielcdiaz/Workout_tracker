class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    unless logged_in?
      redirect_to new_session_path
    end
  end
  
  def logged_in?
    return true if current_user
  end
  
  def current_user
    @current_user = User.find_by_email(session[:email])
  end
end
