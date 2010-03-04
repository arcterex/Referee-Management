class AddAgeIdFromGames < ActiveRecord::Migration
  def self.up
    add_column :games, :age_id, :integer
  end

  def self.down
    remove_column :games, :age_id
  end
end
