require 'spec_helper'

describe AgeGroupsController do

  def mock_age_group(stubs={})
    @mock_age_group ||= mock_model(AgeGroup, stubs)
  end

  describe "GET index" do
    it "assigns all age_groups as @age_groups" do
      AgeGroup.stub(:find).with(:all).and_return([mock_age_group])
      get :index
      assigns[:age_groups].should == [mock_age_group]
    end
  end

  describe "GET show" do
    it "assigns the requested age_group as @age_group" do
      AgeGroup.stub(:find).with("37").and_return(mock_age_group)
      get :show, :id => "37"
      assigns[:age_group].should equal(mock_age_group)
    end
  end

  describe "GET new" do
    it "assigns a new age_group as @age_group" do
      AgeGroup.stub(:new).and_return(mock_age_group)
      get :new
      assigns[:age_group].should equal(mock_age_group)
    end
  end

  describe "GET edit" do
    it "assigns the requested age_group as @age_group" do
      AgeGroup.stub(:find).with("37").and_return(mock_age_group)
      get :edit, :id => "37"
      assigns[:age_group].should equal(mock_age_group)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created age_group as @age_group" do
        AgeGroup.stub(:new).with({'these' => 'params'}).and_return(mock_age_group(:save => true))
        post :create, :age_group => {:these => 'params'}
        assigns[:age_group].should equal(mock_age_group)
      end

      it "redirects to the created age_group" do
        AgeGroup.stub(:new).and_return(mock_age_group(:save => true))
        post :create, :age_group => {}
        response.should redirect_to(age_group_url(mock_age_group))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved age_group as @age_group" do
        AgeGroup.stub(:new).with({'these' => 'params'}).and_return(mock_age_group(:save => false))
        post :create, :age_group => {:these => 'params'}
        assigns[:age_group].should equal(mock_age_group)
      end

      it "re-renders the 'new' template" do
        AgeGroup.stub(:new).and_return(mock_age_group(:save => false))
        post :create, :age_group => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested age_group" do
        AgeGroup.should_receive(:find).with("37").and_return(mock_age_group)
        mock_age_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :age_group => {:these => 'params'}
      end

      it "assigns the requested age_group as @age_group" do
        AgeGroup.stub(:find).and_return(mock_age_group(:update_attributes => true))
        put :update, :id => "1"
        assigns[:age_group].should equal(mock_age_group)
      end

      it "redirects to the age_group" do
        AgeGroup.stub(:find).and_return(mock_age_group(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(age_group_url(mock_age_group))
      end
    end

    describe "with invalid params" do
      it "updates the requested age_group" do
        AgeGroup.should_receive(:find).with("37").and_return(mock_age_group)
        mock_age_group.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :age_group => {:these => 'params'}
      end

      it "assigns the age_group as @age_group" do
        AgeGroup.stub(:find).and_return(mock_age_group(:update_attributes => false))
        put :update, :id => "1"
        assigns[:age_group].should equal(mock_age_group)
      end

      it "re-renders the 'edit' template" do
        AgeGroup.stub(:find).and_return(mock_age_group(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested age_group" do
      AgeGroup.should_receive(:find).with("37").and_return(mock_age_group)
      mock_age_group.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the age_groups list" do
      AgeGroup.stub(:find).and_return(mock_age_group(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(age_groups_url)
    end
  end

end
