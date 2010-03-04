require 'spec_helper'

describe "/ages/show.html.erb" do
  include AgesHelper
  before(:each) do
    assigns[:age] = @age = stub_model(Age,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
  end
end
