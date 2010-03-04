require 'spec_helper'

describe "/ages/index.html.erb" do
  include AgesHelper

  before(:each) do
    assigns[:ages] = [
      stub_model(Age,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(Age,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of ages" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
