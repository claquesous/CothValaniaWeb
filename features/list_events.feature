Feature: List the possible events
  In order to understand my options
  As a member
  I want to be able to see a list of the events

  Background: 
    Given I am logged in
    And There are events named: "Easy Event", "Hard Event"

  Scenario: List of events
    Given I am on the home page
    When I click the "Events" link
    Then I should see an "Easy Event" link
    And I should see a "Hard Event" link

