class SessionsController < ApplicationController
  def new
    
  end

  def create
    # find the user using the email
    user = User.find_by_email params[:email]
    
    # if the user is found and the user's password authenticates
    if user && user.authenticate(params[:password])
      # store the user_id in the session
      session[:user_id]= user.id
    # otherwise redirect them to login
    redirect_to root_url
  
    else 
      flash.now.notice = "Invalid email or password"
      render "new"
      
    end
        
    # use the user_id in the session to load the user when login_required
    session[:user_id] = params[:user_id]
    
    session[:email] = params[:email]
    
    
  end
  
  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end
 
 private
  def create_user_session(user, opts= {})
   back_to = session[:back_to] || opts[:reidrect] || root_url
   log_in(user)
   redirect_to back_to, :notice => "Logged in!"
  end
   

  

end
