class FieldsController < ApplicationController
#  layout "admin_area"
  before_filter :except => [:login,:show] do |controller|
    controller.authorize({"required_user_role" => "admin"})
  end
  
  def index
    @area = Area.find(params[:area_id])
    @fields = @area.fields
  end
  
  def show
    @field = Field.find(params[:id])
  end
  
  def edit
    @field = Field.find(params[:id])
  end
  
  def update
    @field = Field.find(params[:id])
    @area = @field.area

    # ensure that the URL has the correct prefix, etc
    if params[:field][:url].present? then
      theurl = Addressable::URI.heuristic_parse(params[:field][:url])
      unless theurl.nil? 
        params[:field][:url] = theurl.normalize.display_uri.to_s
      end
    end

    if @field.update_attributes(params[:field])
      flash[:notice] = 'Field was successfully updated.'
      redirect_to club_fields_path(@club)
    else
      flash[:error] = 'Error updating field.'
      redirect_to club_fields_path(@club)
    end
  end
  
  # create a new field
  def new
    @field = Field.new
    @club = Area.find(params[:area_id])
  end
  
  def create
    @area  = Area.find(params[:area_id])
    @field = @area.fields.new(params[:field])
    if @field.save
      flash[:notice] = 'Field was successfully created.'
      redirect_to club_fields_path
    else
      flash[:error] = 'Error creating field.'
      render :action => "edit"
    end
  end
  
  # delete a field
  def destroy
    @field = Field.find_by_id(params[:id])
    @area = @field.area
    if @field then
      @field.destroy
      flash[:notice] = "Deleted field."
      redirect_to club_fields_path(@club)
    else 
      flash[:error] = "Unable to find that field"
      redirect_to club_fields_path(@club)
    end
  end
end
