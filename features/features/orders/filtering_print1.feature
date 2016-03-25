Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders

  @filter
  Scenario: Print 1 order
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"
    Then Grid: Check row 1
    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print
    Then Expect printed Order ID is not in Awaiting Shipment tab
    Then Expect printed Order ID is in Shipped tab
    Then Sign out

