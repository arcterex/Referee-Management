class PagesController < ApplicationController
  def index
   @fields = Field.all
  end
  
  def home
      @fields = Field.all
  end

end
