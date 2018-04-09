Feature: Stamps Saucelabs Proof of Concept Test for Browser & Mobile
  Background:
    Given Start test driver

  @saucelabs_poc
  Scenario: Stamps/Saucelabs Browser & Mobile Test
    Then visit Sdc Website
    Then sign-in to SDC Website
    Then sign-out of SDC Website
