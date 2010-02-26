class GamesController < ApplicationController
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
end
