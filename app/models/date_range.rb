class DateRange
  attr_accessor :start_date, :end_date

  def initialize(options={})
    self.start_date = parse_time(options[:start_date] || options[:start])
    self.end_date   = parse_time(options[:end_date]   || options[:end])
    raise ArgumentError "Start and End times needed" unless self.start_date and self.end_date
  end

  def parse_time(time)
    case time
    when String then Time.zone.parse(time)
    when Fixnum then Time.zone.at(time)
    when DateTime, Time then time.in_time_zone
    when ActiveSupport::TimeWithZone then time
    else raise ArgumentError "DateRange only accepts String, Fixnum, Date, DateTime or ActiveSupport::TimeWithZone"
    end
  end

  def cover?(event)
    event.within?(self)
  end

  def within?(date_range)
    (date_range.start_date <= self.end_date and date_range.start_date >= self.start_date) or
      (date_range.end_date >= self.start_date and date_range.end_date <= self.end_date)
  end

  def start_for_url
    _for_url(start_date)
  end

  def end_for_url
    _for_url(end_date)
  end

  def _for_url(time)
    time.strftime("%Y-%m-%d")
  end
end
