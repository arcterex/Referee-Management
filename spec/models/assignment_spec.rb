require 'spec_helper'

describe Assignment do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :user_id => 1,
      :status_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Assignment.create!(@valid_attributes)
  end
end
