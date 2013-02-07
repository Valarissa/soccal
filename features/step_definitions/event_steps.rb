Given /^there are no events$/ do
end

Given /^there are some events$/ do
  @events = [
    Event.new("upcoming", "Event 1"),
    Event.new("current", "Event 1"),
    Event.new("past", "Event 2")
  ]
end

When /^I go to the events page$/ do
  visit events_url
end

Then /^I see no events$/ do
  page.should have_content("There are no events listed at this time")
end

Then /^I see a list of events$/ do
  @events.each do |event|
    within(".#{event.status}") do
      page.should have_css(".event", event.display)
    end
  end
end
