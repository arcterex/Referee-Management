class AddBoygirlToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :gender, :string
  end

  def self.down
    remove_column :games, :gender
  end
end
