require 'spec_helper'

describe Assignor do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address => "value for address",
      :email => "value for email",
      :phone => "value for phone",
      :cell => "value for cell",
      :username => "value for username",
      :password => "value for password"
    }
  end

  it "should create a new instance given valid attributes" do
    Assignor.create!(@valid_attributes)
  end
end
