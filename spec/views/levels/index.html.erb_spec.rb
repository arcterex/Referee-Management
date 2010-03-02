require 'spec_helper'

describe "/levels/index.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:levels] = [
      stub_model(Level,
        :name => "value for name",
        :description => "value for description",
        :certrequired => false
      ),
      stub_model(Level,
        :name => "value for name",
        :description => "value for description",
        :certrequired => false
      )
    ]
  end

  it "renders a list of levels" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
