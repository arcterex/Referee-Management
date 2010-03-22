require 'spec_helper'

describe AssignmentsController do

  #Delete these examples and add some real ones
  it "should use AssignmentsController" do
    controller.should be_an_instance_of(AssignmentsController)
  end


  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end
end
