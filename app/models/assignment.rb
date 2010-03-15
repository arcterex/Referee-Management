class Assignment < ActiveRecord::Base
  belongs_to :status
  validates_presence_of :game_id, :user_id
end
