Feature: Create new events
  In order to configure the site
  As the leader
  I want to be able to be able to create and configure events

  Background: 
    Given I am logged in as the leader

  Scenario: Create a new event
    Given I am on the home page
    When I click "Events"
    Then I click "New Event"
    And I fill in "Name" with "Spaghetti Cookoff"
    And I fill in "Points" with "371"
    And I click "Save"
    Then I should see "Event was successfully created"

