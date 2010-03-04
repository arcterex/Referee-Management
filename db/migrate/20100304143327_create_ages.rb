class CreateAges < ActiveRecord::Migration
  def self.up
    create_table :ages do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :ages
  end
end
