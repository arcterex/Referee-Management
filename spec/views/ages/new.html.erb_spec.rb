require 'spec_helper'

describe "/ages/new.html.erb" do
  include AgesHelper

  before(:each) do
    assigns[:age] = stub_model(Age,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders new age form" do
    render

    response.should have_tag("form[action=?][method=post]", ages_path) do
      with_tag("input#age_name[name=?]", "age[name]")
      with_tag("input#age_description[name=?]", "age[description]")
    end
  end
end
