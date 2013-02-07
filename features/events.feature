Feature: I am able to see my events

  Scenario: There are no events to display
    Given there are no events
    When I go to the events page
    Then I see no events

  Scenario: There are events to display
    Given there are some events
    When I go to the events page
    Then I see an ordered list of events
