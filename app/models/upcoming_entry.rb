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

class UpcomingEntry < Entry
end
