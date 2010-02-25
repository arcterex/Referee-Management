class FieldsController < ApplicationController
  def index
    @fields = Field.all
  end
  def show
    @field = Field.find(params[:id])
  end
end
