
Feature: Change Settings

  Background:
    Given I am signed in as a batch shipper

  @settings
  Scenario: As a batch shipper, I want to change the settings for the batch shipping page.

    * Open Settings Modal
    * Check Show Unavailable Services
    * Check Dont Show Print Confirmation Dialog
    * Check Save Delivery Addresses
    * Check Email Shipment Notifications
    * Check Email Shipment Deliveries
    * Save Settings changes

    * Open Settings Modal
    * Expect Show Unavailable Services Checked
    * Expect Dont Show Print Confirmation Dialog Checked
    * Expect Save Delivery Addresses Checked
    * Expect Email Shipment Notifications Checked
    * Expect Email Shipment Deliveries Checked
    * Uncheck Show Unavailable Services
    * Uncheck Dont Show Print Confirmation Dialog
    * Uncheck Save Delivery Addresses
    * Uncheck Email Shipment Notifications
    * Uncheck Email Shipment Deliveries
    * Save Settings changes

    * Open Settings Modal
    * Expect Show Unavailable Services Unchecked
    * Expect Dont Show Print Confirmation Dialog Unchecked
    * Expect Save Delivery Addresses Unchecked
    * Expect Email Shipment Notifications Unchecked
    * Expect Email Shipment Deliveries Unchecked
    * Change Logoff Time to 10 min.
    * Change Postdate Time to 4:00 p.m.
    * Change Postage Balance Notification Amount to $50
    * Save Settings changes

    * Open Settings Modal
    * Expect Logoff Time to be 10 min.
    * Expect Postdate Time to be 4:00 p.m.
    * Expect Postage Balance Notification Amount to be $50

    * Sign out

