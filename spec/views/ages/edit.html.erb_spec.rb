require 'spec_helper'

describe "/ages/edit.html.erb" do
  include AgesHelper

  before(:each) do
    assigns[:age] = @age = stub_model(Age,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description"
    )
  end

  it "renders the edit age form" do
    render

    response.should have_tag("form[action=#{age_path(@age)}][method=post]") do
      with_tag('input#age_name[name=?]', "age[name]")
      with_tag('input#age_description[name=?]', "age[description]")
    end
  end
end
