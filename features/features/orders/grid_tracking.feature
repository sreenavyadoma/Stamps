
Feature: Orders Grid: Tracking & Order Status

  Background:
    Given I am signed in to Orders

  @grid_tracking
  Scenario: Tracking & Order Status

    Then Orders Toolbar: Add
    Then Orders Grid: Expect Order Status is Awaiting Shipment
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 5
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Tracking to USPS Tracking
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Filter Panel: Select Shipped
    #Then Orders Grid: Sort Order ID in Descending Order
    Then Orders Grid: Expect Tracking Number is populated
    Then Orders Grid: Expect Order Status is Shipped

    Then Orders Toolbar: Add
    Then Orders Grid: Expect Order Status is Awaiting Shipment
    Then Order Details: Set Ship-From to default
    Then Order Details: Set Ship-To to address in Zone 1 through 4
    Then Order Details: Set Ounces to 5
    Then Order Details: Select Service PM Large Package
    Then Order Details: Set Tracking to Signature Required
    Then Print Modal: Open Print Modal
    Then Print Modal: Set Printing On "Shipping Label - 8 ½" x 11" Paper"
    Then Print Modal: Set Printer to "factory"
    Then Print Modal: Print
    Then Filter Panel: Select Shipped
    #Then Orders Grid: Sort Order ID in Descending Order
    Then Orders Grid: Expect Tracking Number is populated
    Then Orders Grid: Expect Order Status is Shipped

    Then Sign out


