class Event
  attr_accessor :status, :display, :date_range, :calendar_id
  delegate :end_date, :start_date, :within?, :to => :date_range

  def initialize(options={})
    self.calendar_id =  options[:calendar_id]   || options[:calendar].try(:id)
    self.date_range =   options[:date_range]    || default_date_range
    self.display =      options[:display]       || default_display
    self.status =       options[:status]        || default_status
    _add_to_event_pool
  end

  def belong_to?(object)
    return false unless respond_to?("#{object.class.name.underscore}_id")
    send("#{object.class.name.underscore}_id") == object.id
  end

  def default_display; 'An Event'; end
  def default_date_range; DateRange.new(start_date: Time.now, end_date: 1.day.from_now); end
  def default_status; 'past'; end

  private

  def _add_to_event_pool
    EventList.event_pool << self
  end
end
