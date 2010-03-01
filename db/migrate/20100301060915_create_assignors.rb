class CreateAssignors < ActiveRecord::Migration
  def self.up
    create_table :assignors do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :cell
      t.string :username
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :assignors
  end
end
