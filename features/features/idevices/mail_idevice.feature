Feature: IDevice Tests
  Background:
    Given Start test driver

  @iphonex
  Scenario: Mail Authentication Test
    Then load mail sign-in page
    Then set Stamps serial number to S12345
    Then expect Stamps serial number is S12345
    Then click Print Sample button
