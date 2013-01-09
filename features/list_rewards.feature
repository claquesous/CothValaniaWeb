Feature: List the possible rewards
  In order to understand my options
  As a member
  I want to be able to see a list of available rewards

  Background: 
    Given I am logged in
    And There are rewards named: "Big Reward", "Small Reward"

  Scenario: List of rewards
    Given I am on the home page
    When I click "Loot"
    Then I should see an "Big Reward" link
    And I should see a "Small Reward" link

