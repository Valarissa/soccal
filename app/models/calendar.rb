##
# Calendars hold events and allow people to view those events
# via Memberships.
#
class Calendar < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :calendar_events
  has_many :events, :through => :calendar_events
  has_many :memberships, :as => :group
end
