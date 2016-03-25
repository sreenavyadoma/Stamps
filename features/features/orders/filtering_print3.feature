Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders

  @filter3
  Scenario: Print 3 orders
    Then Add New Order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"

    Then I Add a second order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "First-Class Mail Large Envelope/Flat"

    Then I Add a third order
    Then Details: Set Ship-From to default
    Then Details: Set Ship-To to Random Address Between Zone 1 through 4
    Then Details: Set Service to "Media Mail Package"

    Then Grid: Check row 1
    Then Grid: Check row 2
    Then Grid: Check row 3

    Then Open Print Modal
    Then Print: Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print: Set Printer to "factory"
    Then Toolbar: Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab
    Then Sign out

    #todo -rob