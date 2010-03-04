require 'spec_helper'

describe AgesController do

  def mock_age(stubs={})
    @mock_age ||= mock_model(Age, stubs)
  end

  describe "GET index" do
    it "assigns all ages as @ages" do
      Age.stub(:find).with(:all).and_return([mock_age])
      get :index
      assigns[:ages].should == [mock_age]
    end
  end

  describe "GET show" do
    it "assigns the requested age as @age" do
      Age.stub(:find).with("37").and_return(mock_age)
      get :show, :id => "37"
      assigns[:age].should equal(mock_age)
    end
  end

  describe "GET new" do
    it "assigns a new age as @age" do
      Age.stub(:new).and_return(mock_age)
      get :new
      assigns[:age].should equal(mock_age)
    end
  end

  describe "GET edit" do
    it "assigns the requested age as @age" do
      Age.stub(:find).with("37").and_return(mock_age)
      get :edit, :id => "37"
      assigns[:age].should equal(mock_age)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created age as @age" do
        Age.stub(:new).with({'these' => 'params'}).and_return(mock_age(:save => true))
        post :create, :age => {:these => 'params'}
        assigns[:age].should equal(mock_age)
      end

      it "redirects to the created age" do
        Age.stub(:new).and_return(mock_age(:save => true))
        post :create, :age => {}
        response.should redirect_to(age_url(mock_age))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved age as @age" do
        Age.stub(:new).with({'these' => 'params'}).and_return(mock_age(:save => false))
        post :create, :age => {:these => 'params'}
        assigns[:age].should equal(mock_age)
      end

      it "re-renders the 'new' template" do
        Age.stub(:new).and_return(mock_age(:save => false))
        post :create, :age => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested age" do
        Age.should_receive(:find).with("37").and_return(mock_age)
        mock_age.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :age => {:these => 'params'}
      end

      it "assigns the requested age as @age" do
        Age.stub(:find).and_return(mock_age(:update_attributes => true))
        put :update, :id => "1"
        assigns[:age].should equal(mock_age)
      end

      it "redirects to the age" do
        Age.stub(:find).and_return(mock_age(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(age_url(mock_age))
      end
    end

    describe "with invalid params" do
      it "updates the requested age" do
        Age.should_receive(:find).with("37").and_return(mock_age)
        mock_age.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :age => {:these => 'params'}
      end

      it "assigns the age as @age" do
        Age.stub(:find).and_return(mock_age(:update_attributes => false))
        put :update, :id => "1"
        assigns[:age].should equal(mock_age)
      end

      it "re-renders the 'edit' template" do
        Age.stub(:find).and_return(mock_age(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested age" do
      Age.should_receive(:find).with("37").and_return(mock_age)
      mock_age.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ages list" do
      Age.stub(:find).and_return(mock_age(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(ages_url)
    end
  end

end
