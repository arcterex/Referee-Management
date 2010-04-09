class AddBoygirlToGame < ActiveRecord::Migration
  def self.up
    add_column :game, :gender, :string
  end

  def self.down
    remove_column :game, :gender
  end
end
