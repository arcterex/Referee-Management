class FieldController < ApplicationController
  layout "admin_area"

  def index
    @fields = Field.all
  end
  def show
    @field = Field.find_by_id(params[:id])
  end
  
  def edit
    @field = Field.find_by_id(params[:id])
  end
  
  def update
    @field = Field.find_by_id(params[:id])
    
    if @field.update_attributes(params[:field])
      flash[:notice] = 'Field was successfully updated.'
      redirect_to :action => "index"
    else
      render :action => "index"
    end
  end
  
  # create a new field
  def new
    @field = Field.new
  end
  
  def create
    @field = Field.new(params[:field])
    if @field.save
      flash[:notice] = 'Field was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
  
  # delete a field
  def destroy
    @field = Field.find_by_id(params[:id])
    if @field then
      @field.destroy
      redirect_to :action => "index"
    else 
      flash[:error] = "Unable to find that field"
      redirect_to :action => "index"
    end
  end
end
