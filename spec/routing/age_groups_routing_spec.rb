require 'spec_helper'

describe AgeGroupsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/age_groups" }.should route_to(:controller => "age_groups", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/age_groups/new" }.should route_to(:controller => "age_groups", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/age_groups/1" }.should route_to(:controller => "age_groups", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/age_groups/1/edit" }.should route_to(:controller => "age_groups", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/age_groups" }.should route_to(:controller => "age_groups", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/age_groups/1" }.should route_to(:controller => "age_groups", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/age_groups/1" }.should route_to(:controller => "age_groups", :action => "destroy", :id => "1") 
    end
  end
end
