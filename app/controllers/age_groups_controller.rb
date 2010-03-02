class AgeGroupsController < ApplicationController
  # GET /age_groups
  # GET /age_groups.xml
  def index
    @age_groups = AgeGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @age_groups }
    end
  end

  # GET /age_groups/1
  # GET /age_groups/1.xml
  def show
    @age_group = AgeGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @age_group }
    end
  end

  # GET /age_groups/new
  # GET /age_groups/new.xml
  def new
    @age_group = AgeGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @age_group }
    end
  end

  # GET /age_groups/1/edit
  def edit
    @age_group = AgeGroup.find(params[:id])
  end

  # POST /age_groups
  # POST /age_groups.xml
  def create
    @age_group = AgeGroup.new(params[:age_group])

    respond_to do |format|
      if @age_group.save
        flash[:notice] = 'AgeGroup was successfully created.'
        format.html { redirect_to(@age_group) }
        format.xml  { render :xml => @age_group, :status => :created, :location => @age_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @age_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /age_groups/1
  # PUT /age_groups/1.xml
  def update
    @age_group = AgeGroup.find(params[:id])

    respond_to do |format|
      if @age_group.update_attributes(params[:age_group])
        flash[:notice] = 'AgeGroup was successfully updated.'
        format.html { redirect_to(@age_group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @age_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /age_groups/1
  # DELETE /age_groups/1.xml
  def destroy
    @age_group = AgeGroup.find(params[:id])
    @age_group.destroy

    respond_to do |format|
      format.html { redirect_to(age_groups_url) }
      format.xml  { head :ok }
    end
  end
end
