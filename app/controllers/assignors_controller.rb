class AssignorsController < ApplicationController
  before_filter :except => :login do |controller|
    controller.authorize({"required_user_role" => "assignor"})
  end
  
  def index
    # get the user and a list of games that they can bid on
    # also get a list of their bids so we can put in what 
    # they've bid on already
    @user = User.find_by_id( session[:user] )
    @statuses = Status.all
    
    # list of assignments that this assignor has assigned
    @assignments = Assignment.assigned_by(@user)
    
    # TODO - need to get eligable games for this assignor for regions
    # get a list of the bids that are in my region/club
    # Remove any bids that already have an assignment
    @allgames = @user.club.games
    @bidgames = Array.new
    @allgames.each do |g|
      allbids = g.bids unless g.bids.empty?
      if ! g.bids.empty? then
        @bidgames << g
      end
    end
    
  end
  
  def create
    # have to figure out how to save assignments here
    @user = User.find_by_id(session[:user])
    
    if request.post?
      logger.debug "Dumping params"
      games = params[:game]

      all_bids = {}
      games.each do |game_id, bids| 
        bids.each do |bid_id, status_id|
          status_id = status_id.to_i
          next if status_id.zero?
          all_bids[bid_id.to_i] = [ game_id.to_i, status_id ]
        end
      end

      bid_map = {}
      Bid.find(all_bids.keys).each do |bid|
        bid_map[bid.id] = bid
      end

      all_bids.each do |bid_id, (game_id, status_id)|
        bid = bid_map[bid_id]
        Assignment.create!(:game_id => game_id, :status_id => status_id, :user_id => bid.user_id, :assignor_id => @user.id)
      end
    end
    redirect_to assignors_path
  end
  
  # def authorize
  #   if User.find_by_id(session[:user]) && session[:user].assignor? then
  #     return
  #   else
  #     flash[:notice] = "Please Login"
  #     # save where we're going
  #     session[:return_to] = request.request_uri
  #     # send to the user login controller
  #     redirect_to :controller => "users", :action => "login"
  #   end
  # end
end
