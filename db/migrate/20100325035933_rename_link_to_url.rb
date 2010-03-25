class RenameLinkToUrl < ActiveRecord::Migration
  def self.up
	rename_column :Fields, :link, :url
  end

  def self.down
  end
end
