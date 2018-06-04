Feature: Saucelabs POC Browser & Mobile
  Background:
    Given Start test driver

  @saucelabs_poc
  Scenario: Orders Authentication
    Then visit Orders landing page
    Then sign-in to orders
