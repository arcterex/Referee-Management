require 'spec_helper'

describe "/age_groups/new.html.erb" do
  include AgeGroupsHelper

  before(:each) do
    assigns[:age_group] = stub_model(AgeGroup,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders new age_group form" do
    render

    response.should have_tag("form[action=?][method=post]", age_groups_path) do
      with_tag("input#age_group_name[name=?]", "age_group[name]")
      with_tag("input#age_group_description[name=?]", "age_group[description]")
    end
  end
end
