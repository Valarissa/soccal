class Calendar
  attr_accessor :id
  @@next_id = 0

  WeeksStartOn = :sunday

  def initialize(options={})
    self.id = options[:id].try(:to_i) or _auto_incremented_id
  end

  def events
    EventList.new.on_calendar(self).events
  end

  def to_param
    id
  end

  def self.day_as_date_range(date)
    FullDay.new(date)
  end

  def self.month_of(date)
    (week_of(month_start, false).first..week_of(month_end, false).last).map{|date| day_as_date_range(date)}
  end

  def self.week_of(date, as_date_ranges=true)
    range = (date.beginning_of_week(WeeksStartOn)..date.end_of_week(WeeksStartOn))
    range.map!(&:day_as_date_range).map{|date| day_as_date_range(date)} if as_date_ranges

    range
  end

  private

  def _auto_incremented_id
    @@next_id += 1
  end

  def self.month_start
    Date.today.beginning_of_month
  end

  def self.month_end
    Date.today.end_of_month
  end
end
