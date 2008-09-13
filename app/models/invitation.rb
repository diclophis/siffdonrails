class Invitation < ActiveRecord::Base
  belongs_to :person
  belongs_to :plan

  validates_presence_of :person_id, :plan_id, :status
end

