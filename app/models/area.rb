class Area < ActiveRecord::Base
  belongs_to :club
  has_many   :fields
end
