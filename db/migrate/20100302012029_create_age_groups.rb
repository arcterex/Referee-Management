class CreateAgeGroups < ActiveRecord::Migration
  def self.up
    create_table :age_groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :age_groups
  end
end
