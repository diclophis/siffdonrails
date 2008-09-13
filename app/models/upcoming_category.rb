# == Schema Information
# Schema version: 20080913194718
#
# Table name: upcoming.category
#
#  id          :text            not null, primary key
#  name        :text            not null
#  description :text            not null
#

#

class UpcomingCategory < YahooBase
  set_table_name "upcoming.category"
end
