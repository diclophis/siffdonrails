class Plan < ActiveRecord::Base
  belongs_to :person

  validates_presence_of :person_id
  validates_presence_of :start_time
  validates_presence_of :title
end
