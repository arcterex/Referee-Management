require 'spec_helper'

describe "/levels/edit.html.erb" do
  include LevelsHelper

  before(:each) do
    assigns[:level] = @level = stub_model(Level,
      :new_record? => false,
      :name => "value for name",
      :description => "value for description",
      :certrequired => false
    )
  end

  it "renders the edit level form" do
    render

    response.should have_tag("form[action=#{level_path(@level)}][method=post]") do
      with_tag('input#level_name[name=?]', "level[name]")
      with_tag('input#level_description[name=?]', "level[description]")
      with_tag('input#level_certrequired[name=?]', "level[certrequired]")
    end
  end
end
