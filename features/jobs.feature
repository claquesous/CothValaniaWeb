Feature: Show jobs for each character
  In order to organize an effective run
  As an admin
  I want to be able to see jobs for characters

  Background:
    Given I am logged in as the leader
    And There are jobs named "Black Mage", "Thief"

  Scenario: Add jobs to a new member
    Given I am on the "Members" page
    When I click "New Member"
    And I fill in "Name" with "Claquesous"
    And I fill in "Password" with "theclaw"
    And I fill in "Password confirmation" with "theclaw"
    And I check "Thief"
    And I click "Save"
    Then I should see a check in the "Claquesous" column for "Thief"
    And I should not see "Black Mage"

