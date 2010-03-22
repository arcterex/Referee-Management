class AssignorsController < ApplicationController
  before_filter :authorize, :except => :login

  def index
    # get the user and a list of games that they can bid on
    # also get a list of their bids so we can put in what 
    # they've bid on already
    @user = User.find_by_id( session[:user] )
    @statuses = Status.all
    
    # list of assignments that this assignor has assigned
    @assignments = Assignment.assigned_by(@user)
    assignment_array = Array.new
    @assignments.each do |x|
      assignment_array << { :user_id => x.user_id, :game_id => x.game_id }
    end
    
    # TODO - need to get eligable games for this assignor for regions
    # get a list of the bids that are in my region/club
    # Remove any bids that already have an assignment
    @allgames = @user.club.games
    @bidgames = Array.new
    @allgames.each do |g|
      allbids = g.bids unless g.bids.empty?
      # TODO - remove any bids that are already in the @assignments array
      # onlybids = allbids.collect do |b|
      #   logger.debug b.inspect
      # end
      # allbids.select { |b| @}
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

      # {"6"=>{"53"=>"0"}, "7"=>{"48"=>"2", "54"=>"1"}, "1"=>{"46"=>"1", "49"=>"0"}, "3"=>{"50"=>"0"}, "4"=>{"47"=>"0", "51"=>"0"}, "5"=>{"52"=>"0"}}
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

      # games.each do |game_id, bids|
      #   bids.delete_if { |k,v| v == '0' }
      #   next if bids.empty?
      # 
      #   bids.each do |bid_id, status_id|
      #     bid = Bid.find(bid_id)
      #     Assignment.create!(:game_id => game_id, :status_id => status_id, :assignor_id => @user.id, :user_id => bid.user_id)
      #   end
      # end
      
      flash[:notice] = "TODO - save assignments"
    end
    redirect_to assignors_path
  end
  
  def authorize
    if User.find_by_id(session[:user]) && session[:user].assignor? then
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
