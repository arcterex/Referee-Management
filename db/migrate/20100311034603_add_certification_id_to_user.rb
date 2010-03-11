class AddCertificationIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :certification_id, :integer
  end

  def self.down
    add_column :users, :certification_id
  end
end
