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
    
    u = User.find_by_id(session[:user])
#    @games = Game.all( :conditions => [ "age_id = ? AND club_id = ?", u.age_id, u.club_id ], :include => [{:field => :club}] )
    @games = 
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
