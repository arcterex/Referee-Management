class RemoveAgegroupIdFromGames < ActiveRecord::Migration
  def self.up
    remove_column :games, :agegroup_id
  end

  def self.down
  end
end
