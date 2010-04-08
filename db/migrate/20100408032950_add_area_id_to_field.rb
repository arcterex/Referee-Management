class AddAreaIdToField < ActiveRecord::Migration
  def self.up
    add_column :fields, :area_id, :integer
  end

  def self.down
    remove_column :fields, :area_id
  end
end
