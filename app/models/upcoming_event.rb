# == Schema Information
# Schema version: 20080913200543
#
# Table name: upcoming.events
#
#  id                  :text            not null, primary key
#  name                :text            not null
#  tags                :text            not null
#  description         :text            not null
#  start_date          :text            not null
#  end_date            :text            not null
#  start_time          :text            not null
#  end_time            :text            not null
#  personal            :text            not null
#  selfpromotion       :text            not null
#  metro_id            :text            not null
#  venue_id            :text            not null
#  user_id             :text            not null
#  category_id         :text            not null
#  date_posted         :text            not null
#  latitude            :text            not null
#  longitude           :text            not null
#  geocoding_precision :text            not null
#  geocoding_ambiguous :text            not null
#  venue_name          :text            not null
#  venue_address       :text            not null
#  venue_city          :text            not null
#  venue_state_name    :text            not null
#  venue_state_code    :text            not null
#  venue_state_id      :text            not null
#  venue_country_name  :text            not null
#  venue_country_code  :text            not null
#  venue_country_id    :text            not null
#  venue_zip           :text            not null
#  venue_url           :text            not null
#  venue_phone         :text            not null
#

#

class UpcomingEvent < YahooBase
  set_table_name "upcoming.events"

  def pretty_start_time
    return DateTime.parse(start_time).strftime("%I:%M:%S%p")
  end
end
