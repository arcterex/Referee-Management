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
  belongs_to :field
end
