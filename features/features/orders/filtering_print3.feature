Feature: Batch Filters for Awaiting Shipment and Shipped tab

  Background:
    Given I am signed in to Orders

  @filter3
  Scenario: Print 3 orders
    Then Add New Order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "First-Class Mail Large Envelope/Flat"

    And I Add a second order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "First-Class Mail Large Envelope/Flat"

    And I Add a third order
    Then Order Details - Set Ship-From to default
    Then Order Details - Order Details - Set Ship-To to Random Address Between Zone 1 through 4
    Then Order Details - Set Service to "Media Mail Package"

    Then Orders Grid - Check row 1
    Then Orders Grid - Check row 2
    Then Orders Grid - Check row 3

    Then Open Print Modal
    Then Print Modal - Set Media "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal - Set Printer to "factory"
    Then Toolbar - Print

    Then Expect all printed Order IDs not in Awaiting Shipment tab
    Then Expect all printed Order IDs are in Shipped tab
    And Sign out

    #todo -rob