Feature:  Web Client Navigation

  Background:
    Given Start test driver

  @web_client_navigation
  Scenario: Contacts BVT Scenario 1 description goes here
    Then sign-in to orders
    Then pause for 2 seconds
    Then navigate to Mail
    Then navigate to Orders
    Then pause for 2 seconds
    Then navigate to Contacts
    Then pause for 2 seconds
    Then navigate to History
    Then pause for 2 seconds
    Then navigate to Reports
    Then pause for 2 seconds
    Then navigate to Products
    Then pause for 2 seconds
    Then navigate to Supplies
    Then pause for 2 seconds
    Then hover on history navigation then select Search Print History
    Then hover on history navigation then select Request a Postage Refund
    Then hover on history navigation then select File an Insurance Claim
    Then hover on history navigation then select Create a SCAN Form
    Then hover on history navigation then select Schedule a USPS Pickup
