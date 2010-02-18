class Renameadminflagfromclubs < ActiveRecord::Migration
  def self.up
    remove_column :clubs, :admin
    add_column :clubs, :is_master, :boolean, :default => 0
  end

  def self.down
      remove_column :clubs, :is_master
  end
end
