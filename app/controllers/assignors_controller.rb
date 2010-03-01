class AssignorsController < ApplicationController
  layout "admin_area"

  def index
    @assignors = Assignor.all
  end
  def show
    @assignor = Assignor.find_by_id(params[:id])
  end
  
  def edit
    @assignor = Assignor.find_by_id(params[:id])
  end
  
  def update
    @assignor = Assignor.find_by_id(params[:id])
    
    if @assignor.update_attributes(params[:assignor])
      flash[:notice] = 'Assignor was successfully updated.'
      redirect_to :action => "index"
    else
      render :action => "index"
    end
  end
  
  # create a new Assignor
  def new
    @assignor = Assignor.new
  end
  
  def create
    @assignor = Assignor.new(params[:assignor])
    if @assignor.save
      flash[:notice] = 'Assignor was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  # delete a Assignor
  def destroy
    @assignor = Assignor.find_by_id(params[:id])
    if @assignor then
      @assignor.destroy
      redirect_to :action => "index"
    else 
      flash[:error] = "Unable to find that Assignor"
      redirect_to :action => "index"
    end
  end
end
