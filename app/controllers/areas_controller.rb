class AreasController < ApplicationController
  before_filter :except => [:login,:show] do |controller|
    controller.authorize({"required_user_role" => "admin"})
  end
  
  def index
    @club = Club.find(params[:club_id])
    @areas = @club.areas
  end

  def new
    @club = Club.find(params[:club_id])
    @area = @club.areas.new
  end
  
  def create
    @club = Club.find(params[:club_id])
    @area = @club.areas.new(params[:area])
    if @area.save
      flash[:notice] = 'Area was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  def edit
    @area = Area.find(params[:id])
  end
  
  def update
    @area = Area.find_by_id(params[:id])

    if @area.update_attributes(params[:area])
      flash[:notice] = 'Area was successfully updated.'
      redirect_to club_areas_path(@area.club)
    else
      render :action => "edit"
    end
  end

  def destroy
  end

end
