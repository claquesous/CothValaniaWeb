Feature: Manage occurrences
  In order to progress the group
  As a member and a leader
  I want to be able to enter information about event occurrences

  Background:
    Given I have a member named "Perseus" 
    And "Perseus" has a character named "Perseus"
    And There are events named: "Medusa", "Cetus"
    And I am logged in as the leader

  Scenario: Requirement progression is satisfied
    Given Event "Medusa" has requirement "Mirror Shield"
    And Event "Medusa" satisfies requirement "Gorgon's Head"
    And Event "Cetus" has requirement "Gorgon's Head"
    And "Perseus" has satisfied requirement "Mirror Shield"
    When I am on the new occurrence page for "Medusa"
    Then I check the "Mirror Shield" requirement for "Perseus"
    And I check the obtained "Gorgon's Head" for "Perseus"
    When I click "Save"
    Then I should see "Event occurrence was successfully created"
    And I should see "Requirements Used: Mirror Shield : Perseus"
    And I should see "Requirements Obtained: Gorgon's Head : Perseus"
    When I am on the new occurrence page for "Cetus"
    Then I check the "Gorgon's Head" requirement for "Perseus"

  Scenario: Add and remove rewards
    Given "Medusa" has reward "Chrysaor"
    And "Perseus" listed "Chrysaor" as their #1 preference
    And I am on the new occurrence page for "Medusa"
    When I check "Chrysaor" as obtained by "Perseus"
    And I click "Save"
    Then I should see "Event occurrence was successfully created"
    And I should see "Rewards: Chrysaor : Perseus"
    When I click "Edit"
    When I uncheck "Chrysaor" as obtained by "Perseus"
    And I click "Save"
    Then I should see "Event occurrence was successfully updated"
    And I should not see "Rewards: Chrysaor : Perseus"

  Scenario: Job attendance
    Given There are jobs named "Hero"
    And "Perseus" has job "Hero"
    And I am on the new occurrence page for "Medusa"
    When I choose "Hero"
    And I click "Save"
    Then I should see "Event occurrence was successfully created"

