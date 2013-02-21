class Event
  attr_accessor :status, :display, :date_range

  def initialize(options={})
    self.status =     options[:status]      || default_status
    self.display =    options[:display]     || default_display
    self.date_range = options[:date_range]  || default_date_range
    self.class.events << self
  end

  def default_status; 'past'; end
  def default_display; 'An Event'; end
  def default_date_range; DateRange.new(start_date: Time.now, end_date: 1.day.from_now); end
  delegate :start_date, :end_date, :to => :date_range

  def self.events(range=nil)
    @events ||= []
    events = @events
    events.select!{|event| range.cover?(event) } if range
    return events unless block_given?
    events.each do |event|
      yield event
    end
  end

  def self.events=(value)
    @events = value
  end

  def self.upcoming_events
    events = @events.select{|event| event.status == 'upcoming'}
    return events unless block_given?
    events.each do |event|
      yield event
    end
  end

  def self.current_events(&block)
    events = @events.select{|event| event.status == 'current'}
    return events unless block_given?
    events.each do |event|
      block.call(event)
    end
  end

  def self.past_events(&block)
    events = @events.select{|event| event.status == 'past'}
    return events unless block_given?
    events.each do |event|
      block.call(event)
    end
  end
end
