class Bid < ActiveRecord::Base
  belongs_to :game, :class_name => "Game", :foreign_key => "game_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates_presence_of :user_id, :on => :create, :message => "can't be blank"
  validates_presence_of :game_id, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :game_id, :scope => [:user_id]
end
