class EventsController < ApplicationController
  def index
    @events = events
  end

  private

  def events
    list = EventList.new
    if params[:from] and params[:to]
      list = list.within(DateRange.new(from: params[:from], to: params[:to]))
    end
    if params[:calendar_id]
      list = list.on_calendar(Calendar.new(id: params[:calendar_id]))
    end

    list
  end
end
