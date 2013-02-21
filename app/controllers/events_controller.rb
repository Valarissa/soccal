class EventsController < ApplicationController
  def index
    date_range = DateRange.new(start: params[:start],
                               end: params[:end]) if params[:start] and params[:end]
    @events = Event.events(date_range)
  end
end
