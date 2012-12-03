Feature: Show jobs for each character
  In order to organize an effective run
  As an admin
  I want to be able to see jobs for characters

  Background:
    Given I have a member named "Claquesous" 
    And "Claquesous" has characters named "Claquesous", "Montparnasse"
    And I am logged in as the leader

  Scenario: I can add jobs
    Given There are jobs named "Black Mage", "Thief"
    Then "Claquesous" has the job "Thief"
    And "Montparnasse" has the job "Black Mage"

