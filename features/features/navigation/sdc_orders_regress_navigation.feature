Feature:  Web Client Navigation

  Background:
    Given Start test driver

  @web_client_navigation
  Scenario: Contacts BVT Scenario 1 description goes here
    Then sign-in to orders

    Then go to url https://customer.corp.stamps.com/Store/account/
    Then pause for 2 seconds
    Then navigate to Contacts
    Then pause for 3 seconds
    Then navigate to Orders
    Then pause for 2 seconds
    Then navigate to Mail
    Then navigate to Reports
    Then pause for 2 seconds
    Then navigate to History
    Then pause for 2 seconds
    Then navigate to Products
    Then pause for 2 seconds
    Then navigate to Supplies
    Then pause for 2 seconds
