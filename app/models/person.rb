# == Schema Information
# Schema version: 20080913194718
#
# Table name: people
#
#  id         :integer(11)     not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Person < ActiveRecord::Base
  has_many :plans
  has_many :invitations

end
