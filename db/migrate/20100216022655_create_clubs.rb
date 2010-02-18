class CreateClubs < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.url :website
      t.integer :admin

      t.timestamps
    end
  end

  def self.down
    drop_table :clubs
  end
end
