Feature: IDevice Tests
  Background:
    Given Start test driver

  @sauce_labs_poc
  Scenario: Saucelabs Proof of Concept Test
    Then visit Sdc Website
    Then sign-in to SDC Website
