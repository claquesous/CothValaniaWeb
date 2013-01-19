Feature: Pass on leadership
  In order to allow the group to keep going after I leave
  As the leader
  I want to be able to pass leadership to another member

  Scenario: Change leader
    Given I have a member named "Riker"
    And "Riker" is an admin
    And I am logged in as the leader
    When I am on the "Members" page
    Then I should not see a check in the "Leader" column for "Riker"
    When I click "Site Config"
    And I select "Riker"
    Then I click "Change Leader"
    When I am on the "Members" page
    Then I should see a check in the "Leader" column for "Riker"
