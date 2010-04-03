class GamesController < ApplicationController
#  layout "admin_area"
  
  def show
    @game = Game.find_by_id(params[:id])
    @title = "Game at #{@game.gametime}"
  end
  
  def index
    @field = Field.find(params[:field_id])
    @games = @field.games
  end
  
  def edit
    @game = Game.find_by_id(params[:id])
  end
  
  def update
    @game = Game.find_by_id(params[:id])

    if @game.update_attributes(params[:game])
      flash[:notice] = 'Game was successfully updated.'
      redirect_to :action => "index"
    else
      render :action => "edit"
    end
  end
  
  # delete a game
  def destroy
    @game = Game.find_by_id(params[:id])
    @field = @game.field
    if @game then
      @game.destroy
      flash[:notice] = "Deleted game."
      redirect_to(field_games_path(@field))
    else 
      flash[:error] = "Unable to find that game"
      redirect_to(field_games_path(@field))
    end
  end
  
  # create a new game
  def new
    @field = Field.find(params[:field_id])
    @game = Game.new
  end
  
  # save 
  def create
    @field = Field.find(params[:field_id])
    @game = @field.games.new(params[:game])
    if @game.save
      flash[:notice] = 'Game was successfully created.'
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end
end
