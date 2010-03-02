require 'spec_helper'

describe Level do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :certrequired => false
    }
  end

  it "should create a new instance given valid attributes" do
    Level.create!(@valid_attributes)
  end
end
