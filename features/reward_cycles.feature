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
     And I should see "1. Unavailable (Reward cycle 2)"
     When I click "Edit"
     Then I should not be able to set a #1 preference
     And I should be able to set a #2 preference

   Scenario: Long time without receiving anything
     Given "Meze" has received their 1,2 picks on "2012-12-12"
     When I click "My Page"
     And I click "Edit"
     When I click "Begin New Reward Cycle"
     Then I should see "Cycle date: 2012-12-12"


