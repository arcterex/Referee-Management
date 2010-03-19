class Assignment < ActiveRecord::Base
  belongs_to :status
  belongs_to :game
  belongs_to :user
  validates_presence_of :game_id, :user_id
  named_scope :assigned_by, lambda { |user|
    { :conditions => { :assignor_id => user.id } }
  }
end
