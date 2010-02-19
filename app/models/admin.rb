class Admin < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :password
  has_many :clubs
end
