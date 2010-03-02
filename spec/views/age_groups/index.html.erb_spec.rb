require 'spec_helper'

describe "/age_groups/index.html.erb" do
  include AgeGroupsHelper

  before(:each) do
    assigns[:age_groups] = [
      stub_model(AgeGroup,
        :name => "value for name",
        :description => "value for description"
      ),
      stub_model(AgeGroup,
        :name => "value for name",
        :description => "value for description"
      )
    ]
  end

  it "renders a list of age_groups" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for description".to_s, 2)
  end
end
