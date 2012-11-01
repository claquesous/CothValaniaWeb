Feature: Show latest news
  In order to communicate news
  As a leader
  I want to post news on the home page

  Scenario: One news entry
    Given There is a News entry with text "Breaking News!"
    And I am logged in
    Then I should see "Breaking News!"
    And I should not see "Read past news"

  Scenario: No recent news
    Given I am logged in
    And There are no News entries
    Then I should not see any news articles

  Scenario: Multiple news entries
    Given There is a News entry with text "Older news"
    And There is a News entry with text "Newer news"
    And I am logged in
    Then I should see "Newer news"
    And I should not see "Older news"
    When I click the "Read past news" link
    Then I should see "Older news"