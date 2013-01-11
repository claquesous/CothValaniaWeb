Feature: Site initialization and configuration
  In order to setup and configure the site
  As a leader
  I want to an easy form for initializing the site

  Scenario: Configure site
    Given I am on the "Rewards" page
    Then I should see "Welcome to your new Cvweb"
    When I am on the login page
    Then I should see "Welcome to your new Cvweb"
    When I fill in "Site name" with "Au Gratin Tomatoes"
    And I fill in "Password" with "yummy!"
    And I fill in "Password confirmation" with "yummy!"
    And I fill in "Name" with "Claquesous"
    And I fill in "Members" with "Roster"
    And I fill in "Rewards" with "Loot"
    And I click "Save"
    Then I should see "Your site has been configured"
    And I should see "Roster"
    And I should see "Loot"

  Scenario: Changing configuration
    Given I have configured the site
    And I am logged in as the leader
    When I click "Site Config"
    And I click "Edit"
    And I fill in "Occurrences" with "Raids"
    And I fill in "Password" with "password"
    And I fill in "Comment" with "Setting occurrences to raids"
    And I click "Save"
    Then I should see "Raids"
    And I should see "Site config was successfully updated"

  Scenario: Trying to change password
    Given I have configured the site
    And I am logged in as the leader
    When I click "Site Config"
    And I click "Edit"
    And I fill in "Password" with "password"
    And I fill in "New password" with "gross!"
    And I fill in "Password confirmation" with "gross"
    And I click "Save"
    Then I should see "Password doesn't match confirmation"
    And I fill in "Password" with "password"
    And I fill in "Comment" with "I didn't really do anything"
    Then I click "Save"
    Then I should see "Site config was successfully updated"
