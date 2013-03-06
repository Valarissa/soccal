class EventList
  attr_accessor :events

  def initialize(events=nil)
    self.events = events || self.class.event_pool
    delegate_methods
  end

  def delegate_methods
    @events.public_methods(false).each do |m|
      (class << self; self; end).class_eval do
        define_method(m) do |*args|
          @events.send m, *args
        end unless self.respond_to?(m)
      end
    end
  end

  def events
    if block_given?
      @events.each do |event|
        yield event
      end
    else
      @events
    end
  end

  def within(date_range)
    EventList.new(events.select{|event| event.within?(date_range)})
  end

  def on_calendar(calendar)
    EventList.new(events.select{|event| event.belong_to?(calendar)})
  end

  def upcoming_events
    list = EventList.new(events.select{|event| event.status == 'upcoming'})
    list.events{|event| yield } if block_given?
    list
  end

  def current_events
    list = EventList.new(events.select{|event| event.status == 'current'})
    list.events{|event| yield } if block_given?
    list
  end

  def past_events
    list = EventList.new(events.select{|event| event.status == 'past'})
    list.events{|event| yield } if block_given?
    list
  end

  def self.events
    new.events
  end

  def self.event_pool
    @events ||= []
  end

  def self.clear
    event_pool.clear
  end
end
