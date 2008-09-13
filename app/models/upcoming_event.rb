#

class UpcomingEvent < YahooBase
  set_table_name "upcoming.events"

  def pretty_start_time
    return DateTime.parse(start_time).strftime("%I:%M:%S%p")
  end
end
