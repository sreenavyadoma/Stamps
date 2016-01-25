
Feature: Logoff if the application is inactive

  Background:
    Given I am signed in to Orders

  @general_settings
  Scenario: Logoff if the application is inactive

    Then Open Settings Modal

    Then Settings:  Set Postdate to 12:00 a.m.

    Then Settings: Close

    And Sign out

