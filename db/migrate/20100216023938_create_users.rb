class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.string :cell
      t.string :username
      t.string :password
      t.text :notes
      t.date :dob
      t.integer :level
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
