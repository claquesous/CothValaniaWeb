Feature: Drop rates
  In order to see the chances for obtaining an item
  As a member
  I would like to see drop rates for rewards

  Background:
    Given I am logged in as the leader
    And There is an event named "Fall"
    And "Fall" has reward "Leaves"

  Scenario: Drop rate
    Given There have been 3 occurrences of "Fall"
    And There was an occurrence of "Fall" which dropped "Leaves"
    When I am on the rewards page for "Leaves"
    Then I should see "Fall 25.0%"
