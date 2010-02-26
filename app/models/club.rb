# == Schema Information
# Schema version: 20100225033350
#
# Table name: clubs
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :string(255)
#  phone      :string(255)
#  website    :string(255)
#  admin_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Club < ActiveRecord::Base
  belongs_to :admin
  validates_presence_of :admin_id, :on => :create, :message => "can't be blank"
  validates_presence_of :name
end
