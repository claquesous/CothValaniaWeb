Feature: Update active members
  To limit the views of members to active ones
  As an admin
  I wish to update the active members list easily

  Background:
    Given I have members named "Claquesous", "Varond"
    And "Claquesous" is inactive
    And "Varond" is active
    And I am logged in as an admin

  Scenario: Set active members
    Given I am on the "Members" page
    Then I should see "Varond"
    And I should not see "Claquesous"
    When I click "Update Active"
    Then I should see "Varond"
    And I should see "Claquesous"
    When I check the box next to "Claquesous"
    And I uncheck the box next to "Varond"
    And I click "Update Active"
    Then I should not see "Varond"
    And I should see "Claquesous"
