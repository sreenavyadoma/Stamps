
Feature: Checkoxes Services, Print Confirm, USPS Terms, Contacts and Shipments

  Background:
    Given I am signed in to Orders

  @general_settings
  Scenario: Services, Print Confirm, USPS Terms, Contacts and Shipments

    Then Open Settings Modal
    Then Settings: Check Services
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Services Checked

    Then Settings:  Uncheck Services
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Services Unchecked

    Then Settings: Check Print Confirm
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Print Confirm Checked

    Then Settings: Uncheck Print Confirm
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Print Confirm Unchecked

    Then Settings: Check USPS Terms
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect USPS Terms Checked

    Then Settings: Uncheck USPS Terms
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect USPS Terms Unchecked

    Then Settings: Check Contacts
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Contacts Checked

    Then Settings: Uncheck Contacts
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Contacts Unchecked

    Then Settings: Check Shipments
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Shipments Checked

    Then Settings: Uncheck Shipments
    Then Settings:  Save
    Then Open Settings Modal
    Then Settings:  Expect Shipments Unchecked

    Then Settings:  Close

    And Sign out

