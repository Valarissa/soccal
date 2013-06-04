Feature: I am able to see my calendars
  Scenario: The calendar is empty
    Given a calendar exists
    When I view the calendar
    Then I should see an empty calendar

  Scenario: The calendar has some events
    Given a calendar exists
    And there are some events
    When I view the calendar
    Then I should see events in the calendar
