# == Schema Information
# Schema version: 20100225033350
#
# Table name: fields
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :string(255)
#  link       :string(255)
#  notes      :text
#  created_at :datetime
#  updated_at :datetime
#

class Field < ActiveRecord::Base
  has_many :games
  validates_presence_of :name,    :on => :save, :message => "can't be blank"
  validates_presence_of :address, :on => :save, :message => "can't be blank"
end
