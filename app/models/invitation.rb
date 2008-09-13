# == Schema Information
# Schema version: 20080913211325
#
# Table name: invitations
#
#  id         :integer(11)     not null, primary key
#  plan_id    :integer(11)
#  person_id  :integer(11)
#  status     :string(255)     default("--- :yes\n")
#  created_at :datetime
#  updated_at :datetime
#

class Invitation < ActiveRecord::Base
  belongs_to :person
  belongs_to :plan

  validates_presence_of :person_id, :plan_id, :status
end

