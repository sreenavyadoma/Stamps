
Feature: Show unavailable services

  Background:
    Given I am signed in to Orders

  @general_settings
  Scenario: Show unavailable services

    Then Open Settings Modal
    Then Settings: Check Services
    Then Settings: Save
    Then Open Settings Modal
    Then Expect Settings:  Services Checked

    Then Settings:  Uncheck Services
    Then Settings: Save
    Then Open Settings Modal
    Then Expect Settings:  Show unavailable service Unchecked
    Then Settings: Close

    And Sign out

