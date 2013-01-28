##
# Events aggregate Media objects surrounding an event. Pre- Post- and
# during updates, as well as being the hub for moderating event pages.
#
class Event < ActiveRecord::Base
  attr_accessible :description, :name, :location

  has_many :calendar_events
  has_many :calendars, :through => :calendar_events
  has_one :event_time
  has_many :occurrences, :through => :event_time
  has_many :media, :as => :target
  has_many :memberships, :as => :group
end
