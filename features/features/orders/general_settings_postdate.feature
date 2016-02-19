
Feature: Postdate

  Background:
    Given I am signed in to Orders

  @general_settings
  Scenario: Postdate

    Then Open Settings Modal

    Then Settings:  Set Postdate to 12:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 12:00 a.m.

    Then Settings:  Set Postdate to 1:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 1:00 a.m.

    Then Settings:  Set Postdate to 2:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 2:00 a.m.

    Then Settings:  Set Postdate to 3:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 3:00 a.m.

    Then Settings:  Set Postdate to 4:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 4:00 a.m.

    Then Settings:  Set Postdate to 5:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 5:00 a.m.

    Then Settings:  Set Postdate to 6:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 6:00 a.m.

    Then Settings:  Set Postdate to 7:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 7:00 a.m.

    Then Settings:  Set Postdate to 8:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 8:00 a.m.

    Then Settings:  Set Postdate to 9:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 9:00 a.m.

    Then Settings:  Set Postdate to 10:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 10:00 a.m.

    Then Settings:  Set Postdate to 11:00 a.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 11:00 a.m.

    Then Settings:  Set Postdate to 12:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 12:00 p.m.

    Then Settings:  Set Postdate to 1:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 1:00 p.m.

    Then Settings:  Set Postdate to 2:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 2:00 p.m.

    Then Settings:  Set Postdate to 3:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 3:00 p.m.

    Then Settings:  Set Postdate to 4:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 4:00 p.m.

    Then Settings:  Set Postdate to 5:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 5:00 p.m.

    Then Settings:  Set Postdate to 6:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 6:00 p.m.

    Then Settings:  Set Postdate to 7:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 7:00 p.m.

    Then Settings:  Set Postdate to 8:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 8:00 p.m.

    Then Settings:  Set Postdate to 9:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 9:00 p.m.

    Then Settings:  Set Postdate to 10:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 10:00 p.m.

    Then Settings:  Set Postdate to 11:00 p.m.
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Postdate set to 11:00 p.m.

    Then Settings:  Close

    Then Sign out

