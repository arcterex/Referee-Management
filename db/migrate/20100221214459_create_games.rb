class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.datetime :gametime
      t.integer :field_id
      t.string :home
      t.string :away

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
