class AddCupFlagToGame < ActiveRecord::Migration
  def self.up
	add_column :Games, :cup, :boolean
  end

  def self.down
	remove_column :Games, :cup
  end
end
