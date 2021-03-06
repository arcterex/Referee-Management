class UsersController < ApplicationController
  include ApplicationHelper
#  layout 'admin_area'
  before_filter :except => [:login,:logout] do |controller|
    controller.authorize({"required_user_role" => "admin"})
  end
  
  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:password])
        flash[:message]  = "Login successful"
        # send the user to the home page defined by their role
        redirect_to user_role_path(session[:user])
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
        redirect_to(admins_url)
      else 
        flash[:error] = "Unable to find that User"
        redirect_to users_path
      end
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to users_path
    else
      redirect_to edit_user_path
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
      redirect_to users_path
    else
      flash[:error] = "Error saving user."
      render :action => "edit"
    end
  end
  
  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to root_path
  end  
end