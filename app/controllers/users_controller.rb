class UsersController < ApplicationController
  layout 'admin_area'
  
#  before_filter :login_required, :only => :login

  def login
    if request.post?
      logger.debug "Authorizing #{params[:user][:username]} / #{params[:user][:password]}"
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:password])
        flash[:message]  = "Login successful"
        # redirect implicitly to the page for the user (for now)
        #redirect_to_stored
        logger.debug "user #{params[:user]} logged in"
        if session[:user].referee? then
          logger.debug "sending to bids (ref)"
          redirect_to :controller=>'bids', :action=>'index'
        end
        if session[:user].assignor? then
          logger.debug "sending to assigns (assignor)"
          redirect_to :controller=>'assignors', :action=>'index'
        end
        logger.debug "Fallthrough, no user type!"
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end
  
  def index
    @users = User.all
  end

  def destroy
      @user = User.find_by_id(params[:id])
      if @user then
        @user.destroy
        redirect_to(@user)
      else 
        flash[:error] = "Unable to find that User"
        redirect_to :action => "index"
      end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end


  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end

  # show the User's formatted information
  def show
    @user = User.find_by_id(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :controller => "pages", :action => 'index'
#    redirect_to :action => 'login'
  end
  
end