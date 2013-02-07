Given /^there are no events$/ do
end

When /^I go to the events page$/ do
  visit events_url
end

Then /^I see no events$/ do
  page.should have_content("There are no events at this time")
end

Given /^there are some events$/ do
  pending
end

Then /^I see an ordered list of events$/ do
  pending
end
