require 'spec_helper'

describe GamesController do

  #Delete these examples and add some real ones
  it "should use GamesController" do
    controller.should be_an_instance_of(GamesController)
  end


  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'list'" do
    it "should be successful" do
      get 'list'
      response.should be_success
    end
  end
end
