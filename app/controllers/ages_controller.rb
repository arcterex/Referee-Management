class AgesController < ApplicationController
  layout 'admin_area'

  # GET /ages
  # GET /ages.xml
  def index
    @ages = Age.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ages }
    end
  end

  # GET /ages/1
  # GET /ages/1.xml
  def show
    @age = Age.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @age }
    end
  end

  # GET /ages/new
  # GET /ages/new.xml
  def new
    @age = Age.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @age }
    end
  end

  # GET /ages/1/edit
  def edit
    @age = Age.find(params[:id])
  end

  # POST /ages
  # POST /ages.xml
  def create
    @age = Age.new(params[:age])

    respond_to do |format|
      if @age.save
        flash[:notice] = 'Age was successfully created.'
        format.html { redirect_to(@age) }
        format.xml  { render :xml => @age, :status => :created, :location => @age }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @age.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ages/1
  # PUT /ages/1.xml
  def update
    @age = Age.find(params[:id])

    respond_to do |format|
      if @age.update_attributes(params[:age])
        flash[:notice] = 'Age was successfully updated.'
        format.html { redirect_to(@age) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @age.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ages/1
  # DELETE /ages/1.xml
  def destroy
    @age = Age.find(params[:id])
    @age.destroy

    respond_to do |format|
      format.html { redirect_to(ages_url) }
      format.xml  { head :ok }
    end
  end
end
