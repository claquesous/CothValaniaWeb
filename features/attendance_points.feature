Feature: Show members attendance points
  In order to know my progress towards rewards
  As a member
  I want to be able to see mine and others attendance points

  Background:
    Given I have a member named "Member" 
    And "Member" has a character named "Character"
    And There is an event named "Event" which is worth 2 points
    And "Character" attended "Event"
    And I am logged in

  Scenario: I should see attendance points
    Given I am on the "Members" page
    Then I should see "Member" has 2 points

  Scenario: I get more points
    Given There is an event named "Big Event" which is worth 5 points
    And "Character" attended "Big Event"
    When I am on the "Members" page
    Then I should see "Member" has 7 points

  Scenario: Different characters
    Given "Member" has a character named "Other Character"
    And "Other Character" attended "Event"
    When I am on the "Members" page
    Then I should see "Member" has 4 points
