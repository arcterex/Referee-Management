# == Schema Information
# Schema version: 20100225033350
#
# Table name: games
#
#  id         :integer         not null, primary key
#  gametime   :datetime
#  field_id   :integer
#  home       :string(255)
#  away       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many   :referee
  belongs_to :field
  belongs_to :level
  belongs_to :age
  validates_presence_of :field_id,  :on => :save, :message => "can't be blank"
  validates_presence_of :gametime,  :on => :save, :message => "can't be blank"
  validates_presence_of :home,      :on => :save, :message => "can't be blank"
  validates_presence_of :away,      :on => :save, :message => "can't be blank"
end
