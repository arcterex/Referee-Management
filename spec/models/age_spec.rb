require 'spec_helper'

describe Age do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Age.create!(@valid_attributes)
  end
end
