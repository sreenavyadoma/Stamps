Feature: Saucelabs POC Browser & Mobile
  Background:
    Given Start test driver

  @saucelabs_poc
  Scenario: Orders Authentication
    Then visit Sdc Website
    Then sign-in to SDC Website
    Then sign-out of SDC Website

