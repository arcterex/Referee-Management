require 'spec_helper'

describe "/levels/show.html.erb" do
  include LevelsHelper
  before(:each) do
    assigns[:level] = @level = stub_model(Level,
      :name => "value for name",
      :description => "value for description",
      :certrequired => false
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ description/)
    response.should have_text(/false/)
  end
end
