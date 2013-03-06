class EventsController < ApplicationController
  def index
    @events = events
  end

  private

  def events
    list = EventList.new
    if params[:start] and params[:end]
      list = list.within(DateRange.new(start: params[:start], end: params[:end]))
    end
    if params[:calendar_id]
      list = list.on_calendar(Calendar.new(id: params[:calendar_id]))
    end

    list
  end
end
