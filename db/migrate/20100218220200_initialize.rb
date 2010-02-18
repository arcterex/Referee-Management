class Initialize < ActiveRecord::Migration
  def self.up
    # clubs table to define the clubs
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :website
      t.integer :admin_id
      t.boolean :is_master, :default => 0

      t.timestamps
    end

    # admin table for who is the controller of a club
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.boolean :master, :default => 0
      t.timestamps
    end

    # users include ref sand linesman
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
  
    # age group table
    create_table :age_groups do |t|
      t.string :name

      t.timestamps
    end

    # levels
    create_table :level_groups do |t|
      t.string :name

      t.timestamps
    end

  end
  def self.down
    drop_table :clubs
    drop_table :admins
    drop_table :users
    drop_table :age_groups
    drop_table :level_groups
  end

end
