class AddAdminIdToClub < ActiveRecord::Migration
  def self.up
    add_column :clubs, :admin_id, :integer
  end

  def self.down
    remove_column :clubs, :admin_id
  end
end
