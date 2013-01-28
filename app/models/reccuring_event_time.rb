##
# Class designed to handle recurring events, frequencies can be
# once per week/month/daily/yearly etc. More specific instructions can
# be denoted. The frequency text object allows a JSON object to be
# saved which is decoded upon retrieval into an appropriate object.
#
class RecurringEventTime < EventTime
  attr_accessible :recurrence, :next_occurrence

  has_many :occurrences
end
