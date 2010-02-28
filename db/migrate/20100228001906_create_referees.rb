class CreateReferees < ActiveRecord::Migration
  def self.up
    create_table :referees do |t|
      t.string :name
      t.string :address
      t.string :email
      t.date :dob
      t.string :phone
      t.string :cell
      t.string :username
      t.string :password
      t.integer :level_id
      t.text :notes
      t.boolean :available

      t.timestamps
    end
  end

  def self.down
    drop_table :referees
  end
end
