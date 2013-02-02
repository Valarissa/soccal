##
# A single occurrence of an event.
#
class Occurrence < ActiveRecord::Base
  attr_accessible :event_time_id, :start, :end, :location
end
