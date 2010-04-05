# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  #filter_parameter_logging :password

  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "users", :action => "login"
    return false 
  end

  def current_user
    session[:user]
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to(return_to)
    else
      redirect_to :controller=>'pages', :action=>'index'
    end
  end
  
  def authorize(vars)
    logger.debug "xxx got vars of #{vars}"
    logger.debug vars.inspect
    
    if User.find_by_id(session[:user]) then
      #&& session[:user].referee? then
      logger.debug vars.inspect
      puts "Getting required auth of #{vars["required_user_role"]}"
      puts "user has #{session[:user].role.name.downcase}"
      if session[:user].role.name.downcase == vars["required_user_role"]
        return
      else
        # role doesn't match
        flash[:warning] = "Invalid permissions to access this page."
        redirect_to login_path
      end
    else
      flash[:notice] = "Please Login"
      # save where we're going
      session[:return_to] = request.request_uri
      # send to the user login controller
      redirect_to login_path
    end
  end

end
