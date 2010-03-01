class Referee < ActiveRecord::Base
  validates_presence_of :name,     :on => :create, :message => "can't be blank"
  validates_presence_of :username, :on => :create, :message => "can't be blank"
  validates_presence_of :password, :on => :create, :message => "can't be blank"
end
