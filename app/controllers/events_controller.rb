Event = Struct.new(:status, :display)

class EventsController < ApplicationController
  def index
    @events = Object.new

    def @events.upcoming_events(&block)
      [
        Event.new("upcoming", "Event 1"),
        Event.new("upcoming", "Event 2")
      ].each(&block)
    end
    def @events.current_events(&block)
      [
        Event.new("current",  "Event 3"),
        Event.new("current",  "Event 4")
      ].each(&block)
    end
    def @events.past_events(&block)
      [
        Event.new("past",     "Event 5"),
        Event.new("past",     "Event 6")
      ].each(&block)
    end
  end
end
