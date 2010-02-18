class Addwebsitetoclub < ActiveRecord::Migration
  def self.up
    add_column :clubs, :website, :string
  end

  def self.down
    drop_column :clubs, :website,  :string
  end
end
