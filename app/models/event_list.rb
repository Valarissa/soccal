class EventList
  attr_accessor :events

  def initialize(events=nil)
    self.events = events || self.class.event_pool
    _delegate_methods
  end

  def current_events
    list = EventList.new(events.select{|event| event.status == 'current'})
    list.events{|event| yield } if block_given?
    list
  end

  def events
    return @events unless block_given?

    @events.each do |event|
      yield event
    end
  end

  def on_calendar(calendar)
    EventList.new(events.select{|event| event.belong_to?(calendar)})
  end

  def past_events
    list = EventList.new(events.select{|event| event.status == 'past'})
    list.events{|event| yield } if block_given?
    list
  end

  def upcoming_events
    list = EventList.new(events.select{|event| event.status == 'upcoming'})
    list.events{|event| yield } if block_given?
    list
  end

  def within(date_range)
    EventList.new(events.select{|event| event.within?(date_range)})
  end

  def self.clear
    event_pool.clear
  end

  def self.event_pool
    @events ||= []
  end

  def self.events
    new.events
  end

  private

  def _delegate_methods
    @events.public_methods(false).each do |m|
      (class << self; self; end).class_eval do
        define_method(m) do |*args|
          @events.send m, *args
        end unless self.respond_to?(m)
      end
    end
  end

end
