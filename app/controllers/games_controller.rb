class GamesController < ApplicationController
  def new
  end
  def index
    @games = Game.all
  end
end
