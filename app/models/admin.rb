# == Schema Information
# Schema version: 20100225033350
#
# Table name: admins
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  password   :string(255)
#  is_master  :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Admin < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :password
  has_many :clubs
end
