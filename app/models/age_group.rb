# == Schema Information
# Schema version: 20100225033350
#
# Table name: age_groups
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class AgeGroup < ActiveRecord::Base
end
