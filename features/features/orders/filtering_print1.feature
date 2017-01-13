Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders

  @filter
  Scenario: Print 1 order
    Then Toolbar: Add
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to address in Zone 1 through 4
    Then Details: Select Service FCM Large Envelope
    Then Grid: Check row 1
    Then Print: Open Modal
    Then Print: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Print: Print
    Then Left Panel: Expect printed Order ID is not in Awaiting Shipment tab
    Then Left Panel: Expect printed Order ID is in Shipped tab
    Then Sign out

