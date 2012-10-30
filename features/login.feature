Feature: Allow members to login
  In order to provide a measure of security
  As a member of the group
  I want to authenticate

  Scenario: User does not exist
    Given I am on the "Login" page
    When I login with invalid credentials
    Then I should be on the "Login" page
    And I should see "Invalid member or password"

  Scenario: User does exist
    Given I have an account named "Member" with password "pass"
    And I am on the "Login" page
    When I login with "Member" and "pass"
    Then I should see "Logged in"
    And I should be on the root page
