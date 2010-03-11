class AddAgegroupIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :age_id, :integer
  end

  def self.down
    remove_column :users, :age_id
  end
end
