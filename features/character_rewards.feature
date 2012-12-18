Feature: Setting rewards wish lists
  In order to communicate my desired rewards
  As a member
  I want to be able to update my wish lists

  Background:
    Given I am logged in as "Claquesous"
    And "Claquesous" has a character named "Claquesous"
    And There are rewards named: "Bottle of Flintstones Vitamines", "Single Soggy Sneaker"

  Scenario: Add rewards with one character
    Given I am on the home page
    When I click "My Page"
    And I click "Edit"
    Then I select "Bottle of Flintstones Vitamines" as my #1 preference
    And I select "Single Soggy Sneaker" as my #2 preference
    And I click "Save"
    Then I should see "1. Bottle of Flintstones Vitamines"
    And I should see "2. Single Soggy Sneaker"

  Scenario: Add rewards with two characters
    Given "Claquesous" has a character named "Montparnasse"
    And I am on the home page
    When I click "My Page"
    And I click "Edit"
    Then I select "Bottle of Flintstones Vitamines" for "Claquesous" as my #1 preference
    And I select "Single Soggy Sneaker" for "Montparnasse" as my #2 preference
    And I click "Save"
    Then I should see "1. Bottle of Flintstones Vitamines Points: 0.0 (Claquesous)"
    And I should see "2. Single Soggy Sneaker Points: 0.0 (Montparnasse)"

  Scenario: Remove rewards
    Given "Claquesous" listed "Single Soggy Sneaker" as their #2 preference
    And I am on the home page
    When I click "My Page"
    And I click "Edit"
    Then I select "" as my #2 preference
    And I click "Save"
    Then I should not see "Single Soggy Sneaker"

