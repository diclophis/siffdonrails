require 'factory_girl'

Factory.sequence(:person_email) { |n| "me+#{n}@me.com" }


Factory.define :person do |p|
  p.email {Factory.next :person_email}
end

Factory.define :plan do |p|
  p.title "Plan Title"  
  p.person {|pp| pp.association :person}
  p.start_time {1.day.from_now}
end

