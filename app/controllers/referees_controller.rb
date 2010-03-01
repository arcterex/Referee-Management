class RefereesController < ApplicationController
  layout 'admin_area'
  def index
    @referees = Referee.all
  end

  def destroy
      @referee = Referee.find_by_id(params[:id])
      if @referee then
        @referee.destroy
        redirect_to(@referee)
      else 
        flash[:error] = "Unable to find that referee"
        redirect_to :action => "index"
      end
  end

  def edit
    @referee = Referee.find_by_id(params[:id])
  end

  
  def update
    @referee = Referee.find_by_id(params[:id])

    if @referee.update_attributes(params[:referee])
      flash[:notice] = 'Referee was successfully updated.'
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end
  
  # show the referee's formatted information
  def show
    @referee = Referee.find_by_id(params[:id])
  end
  
  def new
    @referee = Referee.new
  end
  
  def create
    @referee = Referee.new(params[:referee])
    if @referee.save
      flash[:notice] = 'Referee was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
