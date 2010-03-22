class AddAssignorIdToAssignments < ActiveRecord::Migration
  def self.up
	add_column :assignments, :assignor_id, :integer
  end

  def self.down
	remove_column :assignments, :assignor_id
  end
end
