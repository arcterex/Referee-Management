class FieldsController < ApplicationController
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

    # ensure that the URL has the correct prefix, etc
    if params[:field][:url].present? then
      theurl = Addressable::URI.heuristic_parse(params[:field][:url])
      unless theurl.nil? 
        params[:field][:url] = theurl.normalize.display_uri.to_s
      end
    end

    if @field.update_attributes(params[:field])
      flash[:notice] = 'Field was successfully updated.'
      redirect_to :action => "index"
    else
      # FIXME - why do I need to do this here?
      @fields = Field.all
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
