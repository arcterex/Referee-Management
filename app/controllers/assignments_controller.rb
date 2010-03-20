class AssignmentsController < ApplicationController
  def show
    @assignment = Assignment.find_by_id(params[:id])
  end
  def destroy
    @assignment = Assignment.find(params[:id])
    if @assignment then
      flash[:notice] = "Assignment Deleted"
      @assignment.destroy
    else
      flash[:error] = "Assignment not found!"
    end
    redirect_to(assignors_url)
  end
end
