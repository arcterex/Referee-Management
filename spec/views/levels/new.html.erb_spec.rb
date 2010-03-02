require 'spec_helper'

describe "/levels/new.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:level] = stub_model(Level,
      :new_record? => true,
      :name => "value for name",
      :description => "value for description",
      :certrequired => false
    )
  end

  it "renders new level form" do
    render

    response.should have_tag("form[action=?][method=post]", levels_path) do
      with_tag("input#level_name[name=?]", "level[name]")
      with_tag("input#level_description[name=?]", "level[description]")
      with_tag("input#level_certrequired[name=?]", "level[certrequired]")
    end
  end
end
