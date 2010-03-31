class PagesController < ApplicationController
  def index
    @clubs = Club.all
  end
  
  def home
    @fields = Field.all
  end

end
