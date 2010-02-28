class GamesController < ApplicationController
  layout "admin_area"
  
  def show
    @game = Game.find_by_id(params[:id])
    @title = "Game at #{@game.gametime}"
  end
  
  def index
    @games = Game.all
  end
  
  def edit
    @game = Game.find_by_id(params[:id])
  end
  
  def update
    @game = Game.find_by_id(params[:id])

    if @game.update_attributes(params[:game])
      flash[:notice] = 'Club was successfully updated.'
      redirect_to(@game)
    else
      render :action => "edit"
    end
  end
  
  # delete a game
  def destroy
    @game = Game.find_by_id(params[:id])
    if @game then
      @game.destroy
      redirect_to(@game)
    else 
      flash[:error] = "Unable to find that game"
      redirect_to(games_path)
    end
  end
  
  # create a new game
  def new
    @game = Game.new
  end
  
  # save 
  def create
    @game = Game.new(params[:game])
    if @game.save
      flash[:notice] = 'Game was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
