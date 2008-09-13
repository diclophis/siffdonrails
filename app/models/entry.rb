# == Schema Information
# Schema version: 20080913200543
#
# Table name: entries
#
#  id          :integer(11)     not null, primary key
#  position    :integer(11)
#  plan_id     :integer(11)
#  start_time  :datetime
#  phase       :string(255)
#  type        :string(255)
#  title       :string(255)
#  description :string(255)
#  remote_id   :integer(11)
#  created_at  :datetime
#  updated_at  :datetime
#

class Entry < ActiveRecord::Base
  after_initialize :setup_phase
  belongs_to :plan

  validates_presence_of :plan_id  

  AFTER_PARTY = :after_party
  MAIN_EVENT = :main_event
  MEETUP = :meetup

  def after_party!
    @phase = AFTER_PARTY
  end

  def for_after_party?
    @phase == AFTER_PARTY
  end

  def for_main_event?
    @phase == MAIN_EVENT
  end

  def for_meetup?
    @phase == MEETUP
  end

  def main_event!
    @phase = MAIN_EVENT
  end

  def meetup!
    @phase = MEETUP
  end

  def remote_model
    UpcomingEvent.find(:first, :conditions => ["event_id = ?", remote_id])
  end

  protected
  
  def setup_phase
    @phase = MEETUP unless @phase
  end
end
