require 'spec_helper'

describe LevelsController do

  def mock_level(stubs={})
    @mock_level ||= mock_model(Level, stubs)
  end

  describe "GET index" do
    it "assigns all levels as @levels" do
      Level.stub(:find).with(:all).and_return([mock_level])
      get :index
      assigns[:levels].should == [mock_level]
    end
  end

  describe "GET show" do
    it "assigns the requested level as @level" do
      Level.stub(:find).with("37").and_return(mock_level)
      get :show, :id => "37"
      assigns[:level].should equal(mock_level)
    end
  end

  describe "GET new" do
    it "assigns a new level as @level" do
      Level.stub(:new).and_return(mock_level)
      get :new
      assigns[:level].should equal(mock_level)
    end
  end

  describe "GET edit" do
    it "assigns the requested level as @level" do
      Level.stub(:find).with("37").and_return(mock_level)
      get :edit, :id => "37"
      assigns[:level].should equal(mock_level)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created level as @level" do
        Level.stub(:new).with({'these' => 'params'}).and_return(mock_level(:save => true))
        post :create, :level => {:these => 'params'}
        assigns[:level].should equal(mock_level)
      end

      it "redirects to the created level" do
        Level.stub(:new).and_return(mock_level(:save => true))
        post :create, :level => {}
        response.should redirect_to(level_url(mock_level))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved level as @level" do
        Level.stub(:new).with({'these' => 'params'}).and_return(mock_level(:save => false))
        post :create, :level => {:these => 'params'}
        assigns[:level].should equal(mock_level)
      end

      it "re-renders the 'new' template" do
        Level.stub(:new).and_return(mock_level(:save => false))
        post :create, :level => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested level" do
        Level.should_receive(:find).with("37").and_return(mock_level)
        mock_level.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :level => {:these => 'params'}
      end

      it "assigns the requested level as @level" do
        Level.stub(:find).and_return(mock_level(:update_attributes => true))
        put :update, :id => "1"
        assigns[:level].should equal(mock_level)
      end

      it "redirects to the level" do
        Level.stub(:find).and_return(mock_level(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(level_url(mock_level))
      end
    end

    describe "with invalid params" do
      it "updates the requested level" do
        Level.should_receive(:find).with("37").and_return(mock_level)
        mock_level.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :level => {:these => 'params'}
      end

      it "assigns the level as @level" do
        Level.stub(:find).and_return(mock_level(:update_attributes => false))
        put :update, :id => "1"
        assigns[:level].should equal(mock_level)
      end

      it "re-renders the 'edit' template" do
        Level.stub(:find).and_return(mock_level(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested level" do
      Level.should_receive(:find).with("37").and_return(mock_level)
      mock_level.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the levels list" do
      Level.stub(:find).and_return(mock_level(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(levels_url)
    end
  end

end
