require 'spec_helper'

describe AgesController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/ages" }.should route_to(:controller => "ages", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ages/new" }.should route_to(:controller => "ages", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ages/1" }.should route_to(:controller => "ages", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ages/1/edit" }.should route_to(:controller => "ages", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ages" }.should route_to(:controller => "ages", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/ages/1" }.should route_to(:controller => "ages", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ages/1" }.should route_to(:controller => "ages", :action => "destroy", :id => "1") 
    end
  end
end
