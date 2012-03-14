class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    unless logged_in?
      session[:back_to] = request.url
      redirect_to(login_path, :notice => "You must login to access that page.")
    end
  end
  
  def logged_in?
    return true if current_user
  end
  helper_method :logged_in?
  
  def log_in(user)
      reset_session
      session[:user_id] = user.id
  end
  
  def current_user
    @current_user = User.find_by_email(session[:email])
  end
  ##Lets the model view use this method!
  helper_method :current_user
end
