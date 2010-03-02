require 'spec_helper'

describe LevelsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/levels" }.should route_to(:controller => "levels", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/levels/new" }.should route_to(:controller => "levels", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/levels/1" }.should route_to(:controller => "levels", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/levels/1/edit" }.should route_to(:controller => "levels", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/levels" }.should route_to(:controller => "levels", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/levels/1" }.should route_to(:controller => "levels", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/levels/1" }.should route_to(:controller => "levels", :action => "destroy", :id => "1") 
    end
  end
end
