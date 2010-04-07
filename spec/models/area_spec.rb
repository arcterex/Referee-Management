require 'spec_helper'

describe Area do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :references => 
    }
  end

  it "should create a new instance given valid attributes" do
    Area.create!(@valid_attributes)
  end
end
