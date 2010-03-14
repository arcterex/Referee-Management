class BidsController < ApplicationController
  before_filter :authorize, :except => :login

  def index
    # get the user and a list of games that they can bid on
    # also get a list of their bids so we can put in what 
    # they've bid on already.
    # Games need to match
    # - club_id
    # - age_id
    # ie: select g.id from games g 
    #     join fields f on g.field_id = f.id 
    #     where g.age_id = 1 and f.club_id = 1;
    
    @user  = User.find_by_id(session[:user])
    @games = @user.club.games.eligible_for(@user)
  end
  
  def create
    # take the input of the bids and save them, then return to the bids page
    @user  = User.find_by_id(session[:user])
    # Get all bids of this user and delete them
    @user.bids.delete_all
    # add in the new bids
    if params[:game_id] then
      params[:game_id].each { |id|
        Bid.create!( :user_id => @user.id, :game_id => id )
      }
    end
    
    # send the user back to that page
    flash[:notice] = "Game bids submitted"
    redirect_to :controller => "bids", :action => "index"
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
