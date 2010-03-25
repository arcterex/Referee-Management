class AddNotesToGame < ActiveRecord::Migration
  def self.up
	add_column :Games, :notes, :text
  end

  def self.down
	remove_column :Games, :notes
  end
end
