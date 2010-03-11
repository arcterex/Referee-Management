class BidsController < ApplicationController
  before_filter :authorize, :except => :login

  def index
    # get the user and a list of games that they can bid on
    # also get a list of their bids so we can put in what 
    # they've bid on already
    @user = User.find_by_id(session[:user])
    @games = @user.club.games.eligible_for(@user)
  end
  
  def authorize
    if User.find_by_id(session[:user]) && session[:user].referee? then
      return
    else
      flash[:notice] = "Please Login"
      # save where we're going
      session[:return_to] = request.request_uri
      # send to the user login controller
      redirect_to :controller => "users", :action => "login"
    end
  end
end
