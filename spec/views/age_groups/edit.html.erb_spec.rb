require 'spec_helper'

describe "/age_groups/edit.html.erb" do
  include AgeGroupsHelper

  before(:each) do
    assigns[:age_group] = @age_group = stub_model(AgeGroup,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit age_group form" do
    render

    response.should have_tag("form[action=#{age_group_path(@age_group)}][method=post]") do
      with_tag('input#age_group_name[name=?]', "age_group[name]")
      with_tag('input#age_group_description[name=?]', "age_group[description]")
    end
  end
end
