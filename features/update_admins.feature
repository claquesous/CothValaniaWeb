Feature: Update admins
  To delegate help to a leadership team
  As the leader
  I wish to update the admins easily

  Background:
    Given I have members named "Claquesous", "Varond"
    And "Claquesous" is not an admin
    And "Varond" is an admin
    And I am logged in as the leader

  Scenario: Set admins
    Given I am on the "Members" page
    When I click "Update Admins"
    When I check the box next to "Claquesous"
    And I uncheck the box next to "Varond"
    And I click "Update Admins"
    Then I should not see a check in the "Admin" column for "Varond"
    And I should see a check in the "Admin" column for "Claquesous"
