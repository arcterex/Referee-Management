class AddClubIdToField < ActiveRecord::Migration
  def self.up
    add_column :fields, :club_id, :integer
  end

  def self.down
    remove_column :fields, :club_id
  end
end
