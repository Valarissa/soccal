class FullDay < DateRange
  include Comparable

  def initialize(date)
    date = Date.parse(date) unless date.respond_to?(:beginning_of_day)
    super(start: date.beginning_of_day, end: date.end_of_day)
  end

  def <=>(other_range)
    self.start_date <=> other_range.start_date
  end

  def succ
    FullDay.new(self.start_date + 1.day)
  end

  def html_id
    "date_#{start_date.strftime("%Y-%m-%d")}"
  end
end
