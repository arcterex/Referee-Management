class PageController < ApplicationController
  def index
   @fields = Field.all
  end
  
  def fieldlist
    @fields = Field.all
  end
end
