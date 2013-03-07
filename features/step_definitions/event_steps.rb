Given /^there are no events$/ do
  EventList.clear
end

Given /^there are some events$/ do
  EventList.clear
  Event.new(calendar_id: 1,
            status: "upcoming",
            display: "Event 1",
            date_range: DateRange.new(start_date: 6.days.from_now,
                                      end_date: 7.days.from_now))
  Event.new(calendar_id: 2,
            status: "current",
            display: "Event 2",
            date_range: DateRange.new(start_date: Time.zone.now,
                                      end_date: 1.day.from_now))
  Event.new(calendar_id: 3,
            status: "past",
            display: "Event 3",
            date_range: DateRange.new(start_date: 7.days.ago,
                                      end_date: 6.days.ago))
end

Given /^I specify a date range$/ do
  @date_range = DateRange.new(start_date: 5.days.ago, end_date: 5.days.from_now)
end

Given /^I specify a calendar$/ do
  @calendar = Calendar.new(id: 1)
end

When /^I go to the events page$/ do
  visit events_url
end

When /^I go to the events page with the range$/ do
  visit events_within_date_range_url(*@date_range.to_param)
end

When /^I go to the events page for the calendar$/ do
  visit calendar_events_url(@calendar)
end

Then /^I see no events$/ do
  page.should have_content("There are no events listed at this time")
end

Then /^I see a list of events$/ do
  EventList.new.events do |event|
    within(".#{event.status}") do
      page.should have_css(".event", event.display)
    end
  end
end

Then /^I see a list of events within the range$/ do
  EventList.new.events do |event|
    if event.within?(@date_range)
      within(".#{event.status}") do
        page.should have_css(".event", event.display)
      end
    else
      within(".#{event.status}") do
        page.should_not have_css(".event", event.display)
      end
    end
  end
end

Then /^I see a list of events for that calendar alone$/ do
  EventList.new.events do |event|
    if event.belong_to?(@calendar)
      within(".#{event.status}") do
        page.should have_css(".event", event.display)
      end
    else
      within(".#{event.status}") do
        page.should_not have_css(".event", event.display)
      end
    end
  end
end
