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

  def for_after_party?
    @phase == :after_party
  end

  def for_main_event?
    @phase == :main_event
  end

  def for_meetup?
    @phase == :meetup
  end

  protected
  
  def setup_phase
    @phase = :meetup unless @phase
  end
end
