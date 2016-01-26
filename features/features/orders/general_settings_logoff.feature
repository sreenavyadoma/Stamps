
Feature: Logoff

  Background:
    Given I am signed in to Orders

  @general_settings
  Scenario: Show unavailable services

    Then Open Settings Modal

    Then Settings:  Set Logoff to 5 min.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Logoff is set for 5 min.

    Then Settings:  Set Logoff to 10 min.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Logoff is set for 10 min.

    Then Settings:  Set Logoff to 15 min.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Logoff is set for 15 min.

    Then Settings:  Set Logoff to 30 min.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Logoff is set for 30 min.

    Then Settings:  Set Logoff to 1 hour.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Logoff is set for 1 hour

    Then Settings:  Set Logoff to 2 hours.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Logoff is set for 2 hours

    Then Settings:  Close

    And Sign out

