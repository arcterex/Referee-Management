class UsersController < ApplicationController
  layout 'admin_area'
  
  before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']

  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to_stored
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end
  
  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
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
  
  def login
    render(:layout => "application" )
    if request.post?
      if session[:user] = User.authenticate(params[:user][:login], params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to_stored
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end
  
  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to :action => 'login'
  end
  
end