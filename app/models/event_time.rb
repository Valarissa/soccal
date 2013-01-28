##
# Object designed to handle an events timings and occurrences.
# The class uses Single-Table Inheritance to differentiate between single
# events and recurring events.
#
class EventTime < ActiveRecord::Base
  attr_accessible :event_id, :start_date, :end_date, :start_time, :duration

  belongs_to :event
  has_one :occurrence
end
