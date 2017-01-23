Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders

  @filter
  Scenario: Print 1 order
    Then Orders Toolbar: Add
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Select Service FCM Large Envelope
    Then Orders Grid: Check row 1
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Filter Panel: Expect printed Order ID is not in Awaiting Shipment tab
    Then Filter Panel: Expect printed Order ID is in Shipped tab
    Then Sign out

