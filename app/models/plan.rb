# == Schema Information
# Schema version: 20080913194718
#
# Table name: plans
#
#  id         :integer(11)     not null, primary key
#  person_id  :integer(11)
#  title      :string(255)
#  start_time :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Plan < ActiveRecord::Base
  belongs_to :person
  has_many :entries
  has_many :invitations
  has_many :people, :through => :invitations

  validates_presence_of :person_id
  validates_presence_of :start_time
  #validates_presence_of :title

  has_many :meetups, :class_name => "Entry", :foreign_key => :plan_id, :conditions => {:phase => Entry::MEETUP}
  has_many :main_events, :class_name => "Entry", :foreign_key => :plan_id, :conditions => {:phase => Entry::MAIN_EVENT}
  has_many :after_parties, :class_name => "Entry", :foreign_key => :plan_id, :conditions => {:phase => Entry::AFTER_PARTY}
end
