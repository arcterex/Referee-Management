class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :hashed_password
      t.string :salt
      t.string :name
      t.string :email
      t.string :address
      t.date   :dob
      t.string  :phone
      t.string  :cell
      t.integer :level_id
      t.integer :role_id
      t.boolean :available
      t.text    :notes
      t.integer :role_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
