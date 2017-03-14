
Feature: Proof of Concept

  Background:
    Given I launched default browser

  @googlecheck
  Scenario: Search google for stamps.com then verify that www.stamps.com exists in search results.
    Then Load google search page
    Then Set search textbox to www.betfair.com
    Then Expect result page has www.betfair.com