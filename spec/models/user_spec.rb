require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :username => "value for username",
      :hashed_password => "value for hashed_password",
      :salt => "value for salt",
      :name => "value for name",
      :email => "value for email",
      :address => "value for address",
      :dob => Date.today,
      :phone => "value for phone",
      :cell => "value for cell",
      :level_id => 1,
      :role_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
