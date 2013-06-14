Given /^a calendar exists$/ do
  @calendar = Calendar.new(id: 1)
end

When /^I view the calendar$/ do
  visit calendar_url(@calendar)
end

Then /^I should see an empty calendar$/ do
  Calendar.month_of(Date.today).each do |day|
    page.should have_css("#date_#{day.start_date.strftime('%Y-%m-%d')}")
  end
end

Then /^I should see events in the calendar$/ do
  Calendar.month_of(Date.today).each do |day|
    page.should have_css("##{day.html_id}")
  end
  @calendar.events.each do |event|
    page.should have_css("##{FullDay.new(event.date_range.start_date).html_id} .event")
  end
end

Then /^I should see all the events in a given day$/ do
  @calendar.events.each do |event|
    event.duration.each do |day|
      page.should have_css("##{day.html_id} .event")
    end
  end
end
