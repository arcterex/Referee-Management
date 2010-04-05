class BidsController < ApplicationController
  before_filter :except => :login do |controller|
    controller.authorize({"required_user_role" => "referee"})
  end

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

    # add in the new bids
    if params[:game_id] then
      params[:game_id].each { |id|
        logger.debug "Setting for #{@user.id} and game #{id}"
        Bid.create!( :user_id => @user.id, :game_id => id )
      }
    end
    
    # send the user back to that page
    flash[:notice] = "Game bids submitted"
    redirect_to bids_path
  end
  
  def destroy
    @bid = Bid.find(params[:id])
    @bid.destroy
    
    # TODO - send notification of bid change to admin
    
    redirect_to(bids_path)
  end
end
