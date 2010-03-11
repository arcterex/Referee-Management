class AddClubIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :club_id, :integer
  end

  def self.down
    remove_column :users, :club_id
  end
end
