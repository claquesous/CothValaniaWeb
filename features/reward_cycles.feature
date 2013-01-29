Feature:
  In order for an experienced member to have a better chance at receiving high demand items
  As an experienced member
  I want to be able to restart my point count and get low preference drops again

  Background:
   Given I am logged in as "Meze"

   Scenario: Start new reward cycle
     Given "Meze" has received their 1,2,3,4,5 picks
     And There are 7 rewards
     When I click "My Page"
     And I click "Edit"
     Then I should not be able to set a #1 preference
     And I should not be able to set a #2 preference
     When I click "Begin New Reward Cycle"
     Then I should see "New Reward Cycle started."
     When I click "Edit"
     Then I should not be able to set a #1 preference
     And I should be able to set a #2 preference
     And I should see "1. Unavailable (Reward cycle 2)"

   Scenario: Long time without receiving anything
     Given "Meze" has received their 1,2 picks on "2012-12-12"
     When I click "My Page"
     And I click "Edit"
     When I click "Begin New Reward Cycle"
     Then I should see "Cycle date: 2012-12-12"

  Scenario: Delete attendance from before new cycle
    Given There is an event named "Varond's Birthday" which is worth 20 points
    And "Meze" attended "Varond's Birthday" 5 days ago
    And "Meze" attended "Varond's Birthday" 2 days ago
    And "Meze" has received their 1,2 picks
    When I click "My Page"
    Then I should see "40 / 40"
    And I click "Edit"
    And I click "Begin New Reward Cycle"
    Then I should see "0 / 40"
    When "Meze" no longer attended "Varond's Birthday" 5 days ago
    And I click "My Page"
    Then I should see "0 / 20"
    And "Meze" attended "Varond's Birthday"
    When I click "My Page"
    Then I should see "20 / 40"
