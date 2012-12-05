Feature: Show latest news
  In order to communicate news
  As a leader
  I want to post news on the home page

  Background:
    Given I am logged in as an admin

  Scenario: One news entry
    Given There is a News entry with text "Breaking News!"
    And I am on the home page
    Then I should see "Breaking News!"
    And I should not see "Read past news"

  Scenario: No recent news
    Given There are no News entries
    And I am on the home page
    Then I should not see any news articles

  Scenario: Multiple news entries
    Given There is a News entry with text "Older news"
    And There is a News entry with text "Newer news"
    And I am on the home page
    Then I should see "Newer news"
    And I should not see "Older news"
    When I click "Read past news"
    Then I should see "Older news"
