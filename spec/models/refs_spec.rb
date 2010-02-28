require 'spec_helper'

describe Refs do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :address => "value for address",
      :email => "value for email",
      :dob => Date.today,
      :phone => "value for phone",
      :cell => "value for cell",
      :username => "value for username",
      :password => "value for password",
      :level_id => 1,
      :notes => "value for notes",
      :available => false
    }
  end

  it "should create a new instance given valid attributes" do
    Refs.create!(@valid_attributes)
  end
end
