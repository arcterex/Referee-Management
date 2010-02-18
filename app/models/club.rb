class Club < ActiveRecord::Base
  belongs_to :admin
  validates_presence_of :admin_id, :on => :create, :message => "can't be blank"
end
