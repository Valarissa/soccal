Event = Struct.new(:display)

class EventsController < ApplicationController
  def index
    @events = Object.new

    def @events.each(&block)
      [
        Event.new("Event 1"),
        Event.new("Event 2")
      ].each(&block)
    end
  end
end
