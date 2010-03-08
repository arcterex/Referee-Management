class User < ActiveRecord::Base
  has_many :fields
  validates_presence_of     :name,     :on => :create, :message => "can't be blank"
  validates_presence_of     :username, :on => :create, :message => "can't be blank"
#  validates_confirmation_of :password, :on => :create, :message => "should match confirmation" 
end