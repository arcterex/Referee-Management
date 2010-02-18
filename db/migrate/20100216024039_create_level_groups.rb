class CreateLevelGroups < ActiveRecord::Migration
  def self.up
    create_table :level_groups do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :level_groups
  end
end
