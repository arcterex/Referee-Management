class AddLevelAndAgegroupToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :level_id, :integer
    add_column :games, :agegroup_id, :integer
  end

  def self.down
    remove_column :games, :agegroup_id
    remove_column :games, :level_id
  end
end
