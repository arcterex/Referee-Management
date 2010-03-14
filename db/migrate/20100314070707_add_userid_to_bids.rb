class AddUseridToBids < ActiveRecord::Migration
  def self.up
    remove_column :bids, :referee_id
    remove_column :bids, :assignor_id
    add_column :bids, :user_id, :integer
  end

  def self.down
    remove_column :bids, :user_id
  end
end
