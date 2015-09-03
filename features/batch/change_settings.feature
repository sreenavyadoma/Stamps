@regression
Feature: Change Settings

  Background:
    Given I am signed in as a batch shipper

  @settings
  Scenario: As a batch shipper, I want to change the settings for the batch shipping page.

    Then Open Settings Modal
    Then Check Show Unavailable Services
    Then Check Dont Show Print Confirmation Dialog
    Then Check Save Delivery Addresses
    Then Check Email Shipment Notifications
    Then Check Email Shipment Deliveries
    Then Save Settings changes

    Then Open Settings Modal
    Then Expect Show Unavailable Services Checked
    Then Expect Dont Show Print Confirmation Dialog Checked
    Then Expect Save Delivery Addresses Checked
    Then Expect Order Grid - Email Shipment Notifications Checked
    Then Expect Order Grid - Email Shipment Deliveries Checked
    Then Uncheck Show Unavailable Services
    Then Uncheck Dont Show Print Confirmation Dialog
    Then Uncheck Save Delivery Addresses
    Then Uncheck Email Shipment Notifications
    Then Uncheck Email Shipment Deliveries
    Then Save Settings changes

    Then Open Settings Modal
    Then Expect Show Unavailable Services Unchecked
    Then Expect Dont Show Print Confirmation Dialog Unchecked
    Then Expect Save Delivery Addresses Unchecked
    Then Expect Order Grid - Email Shipment Notifications Unchecked
    Then Expect Order Grid - Email Shipment Deliveries Unchecked
    Then Change Logoff Time to 10 min.
    Then Change Postdate Time to 4:00 p.m.
    Then Change Postage Balance Notification Amount to $50
    Then Save Settings changes

    Then Open Settings Modal
    Then Expect Logoff Time to be 10 min.
    Then Expect Postdate Time to be 4:00 p.m.
    Then Expect Postage Balance Notification Amount to be $50

    And Sign out

