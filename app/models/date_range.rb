class DateRange
  attr_accessor :start_date, :end_date

  def initialize(options={})
    self.start_date = _parse_time(options[:start_date] || options[:start]  || options[:from])
    self.end_date   = _parse_time(options[:end_date]   || options[:end]    || options[:to])
    raise ArgumentError "Start and End times needed" unless self.start_date and self.end_date
  end

  def cover?(event)
    event.within?(self)
  end

  def duration
    if start_date.beginning_of_day != end_date.beginning_of_day
      (FullDay.new(start_date)..FullDay.new(end_date))
    else
      FullDay.new(start_date)
    end
  end

  def to_param
    return _start_for_url, _end_for_url
  end

  def within?(date_range)
    _starts_within(date_range) or _ends_within(date_range) or _straddles(date_range)
  end

  private

  def _end_for_url
    _for_url(end_date)
  end

  def _ends_within(date_range)
    self.end_date >= date_range.start_date and
      self.end_date <= date_range.end_date
  end

  def _for_url(time)
    time.strftime("%Y-%m-%d")
  end

  def _parse_time(time)
    case time
    when String then Time.zone.parse(time)
    when Fixnum then Time.zone.at(time)
    when DateTime, Time then time.in_time_zone
    when ActiveSupport::TimeWithZone then time
    else raise ArgumentError "DateRange only accepts String, Fixnum, Date, DateTime or ActiveSupport::TimeWithZone"
    end
  end

  def _start_for_url
    _for_url(start_date)
  end

  def _starts_within(date_range)
    self.start_date >= date_range.start_date and
      self.start_date <= date_range.end_date
  end

  def _straddles(date_range)
    self.start_date <= date_range.start_date and
      self.end_date >= date_range.end_date
  end
end
