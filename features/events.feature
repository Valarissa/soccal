Feature: I am able to see my events

  Scenario: There are no events to display
    Given there are no events
    When I go to the events page
    Then I see no events

  Scenario: There are events to display
    Given there are some events
    When I go to the events page
    Then I see a list of events

  Scenario: The events displayed are only within a specific range
    Given there are some events
    And I specify a date range
    When I go to the events page with the range
    Then I see a list of events within the range
