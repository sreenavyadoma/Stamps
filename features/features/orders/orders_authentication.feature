@orders_authentication
Feature: Orders Authentication Test
  Background:
    Given I launched the default browser

  Scenario: Orders Authentication Test
    Then I am signed in to Orders
    Then Sign out