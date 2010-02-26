# == Schema Information
# Schema version: 20100225033350
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  address    :string(255)
#  email      :string(255)
#  phone      :string(255)
#  cell       :string(255)
#  username   :string(255)
#  password   :string(255)
#  notes      :text
#  dob        :date
#  level      :integer
#  status     :integer
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
end
