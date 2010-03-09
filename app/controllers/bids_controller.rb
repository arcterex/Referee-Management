class BidsController < ApplicationController
  before_filter :authorize, :except => :login

  def index
    # get the user and a list of games that they can bid on
    # also get a list of their bids so we can put in what 
    # they've bid on already
  end
  
  def authorize
    logger.debug "hit authorize"
    unless User.find_by_id(session[:user])
      flash[:notice] = "Please Login"
      # save where we're going
      session[:return_to] = request.request_uri
      # send to the user login controller
      redirect_to login_path
    end
  end
end