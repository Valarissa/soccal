class FullDay < DateRange
  def initialize(date)
    super(start: date.beginning_of_day, end: date.end_of_day)
  end

  def html_id
    "date_#{start_date.strftime("%Y-%m-%d")}"
  end
end
