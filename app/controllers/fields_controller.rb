class FieldsController < ApplicationController
  layout "admin_area"

  def index
    @fields = Field.all
  end
  def show
    @field = Field.find_by_id(params[:id])
    @club = @field.club
  end
  
  def edit
    @field = Field.find_by_id(params[:id])
  end
  
  def update
    @field = Field.find(params[:id])
    @club = @field.club

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
    @club = Club.find(params[:club_id])
  end
  
  def create
    @club  = Club.find(params[:club_id])
    @field = @club.fields.new(params[:field])
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
    @club = @field.club
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
