Given /^there are no events$/ do
end

Given /^there are some events$/ do
  Event.events = []
  Event.new(status: "upcoming",
            display: "Event 1",
            date_range: DateRange.new(start_date: 6.days.from_now,
                                      end_date: 7.days.from_now))
  Event.new(status: "current",
            display: "Event 2",
            date_range: DateRange.new(start_date: Time.zone.now,
                                      end_date: 1.day.from_now))
  Event.new(status: "past",
            display: "Event 3",
            date_range: DateRange.new(start_date: 7.days.ago,
                                      end_date: 6.days.ago))
end

Given /^I specify a date range$/ do
  @date_range = DateRange.new(start_date: 5.days.ago, end_date: 5.days.from_now)
end

When /^I go to the events page$/ do
  visit events_url
end

When /^I go to the events page with the range$/ do
  visit events_with_range_url(@date_range.start_for_url, @date_range.end_for_url)
end

Then /^I see no events$/ do
  page.should have_content("There are no events listed at this time")
end

Then /^I see a list of events$/ do
  Event.events do |event|
    within(".#{event.status}") do
      page.should have_css(".event", event.display)
    end
  end
end

Then /^I see a list of events within the range$/ do
  Event.events do |event|
    if @date_range.cover?(event)
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
