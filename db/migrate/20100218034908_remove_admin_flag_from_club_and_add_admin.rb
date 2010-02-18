class RemoveAdminFlagFromClubAndAddAdmin < ActiveRecord::Migration
  def self.up
    remove_column :clubs, :admin
    add_column :clubs, :admin, :integer
  end

  def self.down
    remove_column :clubs, :admin
  end
end
