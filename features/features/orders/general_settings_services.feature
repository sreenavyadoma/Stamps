
Feature: Checkoxes Services, Print Confirm, USPS Terms, Contacts and Shipments

  Background:
    Given A user is signed in to Orders

  @general_settings_t1
  Scenario: Services, Print Confirm, USPS Terms, Contacts and Shipments

    Then Open Settings Modal
    Then Settings: Check Services
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Services Checked

    Then In Settings modal,  Uncheck Services
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Services Unchecked

    Then Settings: Check Print Confirm
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Print Confirm Checked

    Then Settings: Uncheck Print Confirm
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Print Confirm Unchecked

    Then Settings: Check USPS Terms
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect USPS Terms Checked

    Then Settings: Uncheck USPS Terms
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect USPS Terms Unchecked

    Then Settings: Check Contacts
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Contacts Checked

    Then Settings: Uncheck Contacts
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Contacts Unchecked

    Then Settings: Check Shipments
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Shipments Checked

    Then Settings: Uncheck Shipments
    Then In Settings modal,  Save
    Then Open Settings Modal
    Then In Settings modal,  Expect Shipments Unchecked

    Then In Settings modal,  Close

    Then Sign out

