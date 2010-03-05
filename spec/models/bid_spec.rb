require 'spec_helper'

describe Bid do
  before(:each) do
    @valid_attributes = {
      :game_id => 1,
      :referee_id => 1,
      :assignor_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Bid.create!(@valid_attributes)
  end
end
