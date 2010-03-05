class Bid < ActiveRecord::Base
  belongs_to :game, :class_name => "Game", :foreign_key => "game_id"
  belongs_to :referee, :class_name => "Referee", :foreign_key => "referee_id"
  belongs_to :assignor, :class_name => "Assignor", :foreign_key => "assignor_id"
end
