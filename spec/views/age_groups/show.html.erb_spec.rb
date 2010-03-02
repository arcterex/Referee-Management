require 'spec_helper'

describe "/age_groups/show.html.erb" do
  include AgeGroupsHelper
  before(:each) do
    assigns[:age_group] = @age_group = stub_model(AgeGroup,
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
