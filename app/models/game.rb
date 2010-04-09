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
  has_many   :bids
  has_many   :assignments
  validates_presence_of :field_id,  :on => :save, :message => "can't be blank"
  validates_presence_of :gametime,  :on => :save, :message => "can't be blank"
  validates_presence_of :home,      :on => :save, :message => "can't be blank"
  validates_presence_of :away,      :on => :save, :message => "can't be blank"
  validates_inclusion_of :gender, :in => [:boy, :girl, :mixed], :on => :create, :message => "extension %s is not included in the list"

  # list of games that the user is eligable to bid on
  named_scope :eligible_for, lambda { |user|
    { :conditions => { :age_id => user.age_id } }
  }
  
  # define the gender as a symbol for lookups
  def gender
    read_attribute(:gender).to_sym
  end
  def gender=(value)
    write_attribute(:gender, value.to_s)
  end
end