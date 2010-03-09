class BidsController < ApplicationController
  before_filter :authorize, :except => :login
  def index
    # get the user and a list of games that they can bid on
    # also get a list of their bids so we can put in what 
    # they've bid on already
  end
  
  def authorize
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please Login"
      redirect_to :controller => "users", :action => "login"
    end
  end
end