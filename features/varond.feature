Feature: The Varond bidding system
  In order to have a fair reward distribution system
  As a leader and as a member
  I want to support the Varond bidding system

  Background:
    Given Member "Claquesous" has 30 points
    And Member "Varond" has 20 points
    And There are rewards named: "Jellied Ham"
    And I am logged in

  Scenario: Higher points wins
    Given "Claquesous" listed "Jellied Ham" as their #1 preference
    And "Varond" listed "Jellied Ham" as their #1 preference
    And I am on the rewards page for "Jellied Ham"
    Then I should see "Claquesous" before "Varond"

  Scenario: Preference point winner
    Given "Claquesous" listed "Jellied Ham" as their #2 preference
    And "Varond" listed "Jellied Ham" as their #1 preference
    And I am on the rewards page for "Jellied Ham"
    Then I should see "Varond" before "Claquesous"

  Scenario: Tie in points
    Given "Claquesous" listed "Jellied Ham" as their #3 preference
    And "Varond" listed "Jellied Ham" as their #2 preference
    And I am on the rewards page for "Jellied Ham"
    Then I should see a tie between "Claquesous" and "Varond"
